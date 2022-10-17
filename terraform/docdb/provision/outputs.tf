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

# docdb_cluster outputs

output "docdb_cluster_instances_arn" {
  description = "Amazon Resource Name (ARN) of the cluster"
  value = aws_docdb_cluster.docdb_cluster.arn
}

output "cluster_members" {
  description = "List of DocDB Instances that are a part of this cluster"
  value = aws_docdb_cluster.docdb_cluster.cluster_members
}

output "cluster_resource_id" {
  description = "The DocDB Cluster Resource ID"
  value = aws_docdb_cluster.docdb_cluster.cluster_resource_id
}

output "endpoint" {
  description = "The DNS address of the DocDB instance"
  value = aws_docdb_cluster.docdb_cluster.endpoint
}

output "hosted_zone_id" {
  description = "The Route53 Hosted Zone ID of the endpoint"
  value = aws_docdb_cluster.docdb_cluster.hosted_zone_id
}

output "id" {
  description = "The DocDB Cluster Identifier"
  value = aws_docdb_cluster.docdb_cluster.id
}

output "reader_endpoint" {
  description = "A read-only endpoint for the DocDB cluster, automatically load-balanced across replicas"
  value = aws_docdb_cluster.docdb_cluster.reader_endpoint
}

# docdb_cluster_instances outputs

  output "db_subnet_group_name" {
  description = "The DB subnet group to associate with this DB instance"
  value = aws_docdb_cluster_instance.docdb_cluster_instances.db_subnet_group_name
}

output "dbi_resource_id" {
  description = "The region-unique, immutable identifier for the DB instance"
  value = aws_docdb_cluster_instance.docdb_cluster_instances.dbi_resource_id
}

output "cluster_instance_endpoint" {
  description = "The DNS address for this instance. May not be writable"
  value = aws_docdb_cluster_instance.docdb_cluster_instances.endpoint
}

output "engine_version" {
  description = "The database engine version"
  value = aws_docdb_cluster_instance.docdb_cluster_instances.engine_version
}

output "port" {
  description = "The database port"
  value = aws_docdb_cluster_instance.docdb_cluster_instances.port
}

output "preferred_backup_window" {
  description = "The daily time range during which automated backups are created if automated backups are enabled"
  value = aws_docdb_cluster_instance.docdb_cluster_instances.preferred_backup_window
}

output "storage_encrypted " {
  description = "Specifies whether the DB cluster is encrypted"
  value = aws_docdb_cluster_instance.docdb_cluster_instances.storage_encrypted
}

output "writer" {
  description = " Boolean indicating if this instance is writable. False indicates this instance is a read replica"
  value = aws_docdb_cluster_instance.docdb_cluster_instances.writer
}

output "ca_cert_identifier" {
  description = "(Optional) The identifier of the CA certificate for the DB instance."
  value = aws_docdb_cluster_instance.docdb_cluster_instances.ca_cert_identifier
}
