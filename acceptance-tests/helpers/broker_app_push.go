package helpers

import (
	"fmt"
	"os"
	"strings"
	"time"

	"code.cloudfoundry.org/jsonry"

	. "github.com/onsi/gomega"
	. "github.com/onsi/gomega/gexec"
)

const brokerUsername = "brokeruser"
const brokerPassword = "brokeruserpassword"

type ServiceBroker struct {
	name          string
	mySqlInstance ServiceInstance
}

func PushAndStartBroker(brokerName, brokerDir string) ServiceBroker {
	brokerApp := pushNoStartServiceBroker(brokerName, brokerDir)
	setEnvVars(brokerName)

	mySqlInstance := CreateService("p.mysql", "db-small")
	CF("bind-service", brokerName, mySqlInstance.name)

	session := StartCF("restart", brokerName)
	waitForAppPush(session, brokerName)

	brokerURL := getBrokerAppURL(brokerApp)
	session = StartCF("create-service-broker", brokerName, brokerUsername, brokerPassword, "https://"+brokerURL, "--space-scoped")
	waitForBrokerOperation(session, brokerName)

	return ServiceBroker{
		name:          brokerName,
		mySqlInstance: mySqlInstance,
	}
}

func (b ServiceBroker) Update(brokerDir string) {
	brokerApp := pushServiceBroker(b.name, brokerDir)

	brokerURL := getBrokerAppURL(brokerApp)
	session := StartCF("update-service-broker", b.name, brokerUsername, brokerPassword, "https://"+brokerURL)
	waitForBrokerOperation(session, b.name)
}

func (b ServiceBroker) Delete() {
	session := StartCF("delete-service-broker", b.name, "-f")
	waitForBrokerOperation(session, b.name)

	session = StartCF("delete", b.name, "-f")
	waitForAppDelete(session, b.name)

	b.mySqlInstance.Delete()
}

func setEnvVars(brokerName string) {
	envVars := requiredEnvVar(
		"AWS_ACCESS_KEY_ID",
		"AWS_SECRET_ACCESS_KEY",
	)

	envVars = append(envVars, optionalEnvVar(
		"GSB_BROKERPAK_BUILTIN_PATH",
		"CH_CRED_HUB_URL",
		"CH_UAA_URL",
		"CH_UAA_CLIENT_NAME",
		"CH_UAA_CLIENT_SECRET",
		"CH_SKIP_SSL_VALIDATION",
	)...)

	envVars = append(envVars,
		EnvVar{Name: "SECURITY_USER_NAME", Value: brokerUsername},
		EnvVar{Name: "SECURITY_USER_PASSWORD", Value: brokerPassword},
		EnvVar{Name: "DB_TLS", Value: "skip-verify"},
		EnvVar{Name: "GSB_PROVISION_DEFAULTS", Value: fmt.Sprintf(`{"aws_vpc_id": %q}`, os.Getenv("AWS_PAS_VPC_ID"))},
		EnvVar{Name: "ENCRYPTION_ENABLED", Value: true},
		EnvVar{Name: "ENCRYPTION_PASSWORDS", Value: `[{"password": {"secret":"superSecretP@SSw0Rd1234!"},"label":"first-encryption","primary":true}]`},
	)

	SetBrokerEnv(brokerName, envVars...)
}

func optionalEnvVar(envVars ...string) []EnvVar {
	var toSet []EnvVar
	for _, envVarName := range envVars {
		value, set := os.LookupEnv(envVarName)
		if set {
			toSet = append(toSet, EnvVar{Name: envVarName, Value: value})
		}
	}
	return toSet
}

func requiredEnvVar(envVars ...string) []EnvVar {
	var toSet []EnvVar
	for _, envVarName := range envVars {
		value := os.Getenv(envVarName)
		Expect(value).NotTo(BeEmpty(), fmt.Sprintf("You must set the %s environment variable", envVarName))
		toSet = append(toSet, EnvVar{Name: envVarName, Value: value})
	}
	return toSet
}

func getBrokerAppURL(brokerApp AppInstance) string {
	out, _ := CF("app", "--guid", brokerApp.name)
	guid := strings.TrimSpace(out)
	env, _ := CF("curl", fmt.Sprintf("/v3/apps/%s/env", guid))

	var receiver struct {
		BrokerURL []string `jsonry:"application_env_json.VCAP_APPLICATION.application_uris[]"`
	}
	err := jsonry.Unmarshal([]byte(env), &receiver)
	Expect(err).NotTo(HaveOccurred())
	return receiver.BrokerURL[0]
}

func pushNoStartServiceBroker(brokerName, brokerDir string) AppInstance {
	session := StartCF("push", brokerName, "--no-start", "-p", brokerDir, "-f", fmt.Sprintf("%s/cf-manifest.yml", brokerDir), "--var", fmt.Sprintf("app=%s", brokerName))
	return waitForAppPush(session, brokerName)
}

func pushServiceBroker(brokerName, brokerDir string) AppInstance {
	session := StartCF("push", brokerName, "-p", brokerDir, "-f", fmt.Sprintf("%s/cf-manifest.yml", brokerDir), "--var", fmt.Sprintf("app=%s", brokerName))
	return waitForAppPush(session, brokerName)
}

func waitForBrokerOperation(session *Session, name string) {
	Eventually(session, 5*time.Minute).Should(Exit())
	Expect(session.ExitCode()).To(BeZero())
}
