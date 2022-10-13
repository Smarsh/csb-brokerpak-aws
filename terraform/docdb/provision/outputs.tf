# Copyright 2020 Pivotal Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

output "docdb_cluster_instances_arn" { value = var.docdb_cluster_arn }
output "docdb_cluster_instances_db_subnet_group_name" {value = var.db_subnet_group_name }
#output "docdb_cluster_instances_dbi_resource_id " {value = }
#output "docdb_cluster_instances_endpoint" {value = }
# ^ we're not sure where these values come from yet
output "docdb_cluster_instances_engine_version" {value = var.engine_version }
output "docdb_cluster_instances_kms_key_id" {value = var.kms_key_id}
output "docdb_cluster_instances_port" {value = var.port}
output "docdb_cluster_instances_preferred_backup_window" {value = var.preferred_backup_window }
output "docdb_cluster_instances_storage_encrypted" {value = var.storage_encrypted}
output "docdb_cluster_instances_tags_all" {value = var.tags_all}
output "docdb_cluster_instances_writer" {value = var.writter}
output "docdb_cluster_instances_ca_cert_identifier" {value = var.ca_cert_identifier}
