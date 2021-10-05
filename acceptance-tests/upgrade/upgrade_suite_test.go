package upgrade_test

import (
	"acceptancetests/helpers"
	"flag"
	"testing"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var developmentBuildDir string
var releasedBuildDir string
var brokerName string

func init() {
	flag.StringVar(&releasedBuildDir, "releasedBuildDir", "/test-broker-update", "location of released version of built broker and brokerpak")
	flag.StringVar(&developmentBuildDir, "developmentBuildDir", "../../", "location of development version of built broker and brokerpak")
	brokerName = helpers.RandomName("csb")
}

func TestUpgrade(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "Upgrade Suite")
}
