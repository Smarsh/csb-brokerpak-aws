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

resource "aws_docdb_cluster" "docdb_cluster" {
  cluster_identifier               = var.cluster_identifier
  db_subnet_group_name            = var.db_subnet_group_name
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name
  deletion_protection             = var.deletion_protection
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  engine_version                  = var.engine_version
  final_snapshot_identifier         = var.final_snapshot_identifier
  master_password                 = var.master_password
  master_username                 = var.master_username
  port                            = var.port
  preferred_backup_window         = var.preferred_backup_window
  preferred_maintenance_window    = var.preferred_maintenance_window
  snapshot_identifier              = var.snapshot_identifier
  storage_encrypted               = var.storage_encrypted
  tags                            = var.tags
  vpc_security_group_ids          = var.vpc_security_group_ids
}

resource "aws_docdb_cluster_instance" "docdb_cluster_instances" {
  cluster_identifier               = var.cluster_identifier.docdb_cluster.id
  count                           = var.instances
  identifier                       = "var.indentifier-${count.index}"
  instance_class                  = var.instance_class
  preferred_maintenance_window    = var.preferred_maintenance_window
  tags                            = var.tags
}