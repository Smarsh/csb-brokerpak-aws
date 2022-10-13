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
  apply_immediately               = var.apply_immediately
  availability_zones              = var.availability_zones
  backup_retention_period         = var.backup_retention
  cluster_identifier_prefix       = var.cluster_identifier_prefix
  cluster_identifier              = var.cluster_identifier
  db_subnet_group_name            = var.db_subnet_group_name
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name
  deletion_protection             = var.deletion_protection
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  engine_version                  = var.engine_version
  engine                          = var.engine
  final_snapshot_identifier       = var.final_snapshot_identifier
  global_cluster_identifier       = var.global_cluster_identifier
  kms_key_id                      = var.kms_key_id
  master_password                 = var.master_password
  master_username                 = var.master_username
  port                            = var.port
  preferred_backup_window         = var.preferred_backup_window
  preferred_maintenance_window    = var.preferred_maintenance_window
  skip_final_snapshot             = var.skip_final_snapshot
  storage_encrypted               = var.storage_encrypted
  tags                            = var.tags
  vpc_security_group_ids          = var.vpc_security_group_ids

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_docdb_cluster_instance" "docdb_cluster_instances" {
  apply_immediately            = var.apply_immediately
  auto_minor_version_upgrade   = var.auto_minor_version_upgrade
  availability_zone            = var.availability_zone
  cluster_identifier           = var.cluster_identifier.docdb_cluster.id
  count                        = var.count
  engine                       = var.engine
  identifier                   = "var.indentifier-${count.index}"
  identifier_prefix            = "var.indentifier-${count.index}"
  instance_class               = var.instance_class
  preferred_maintenance_window = var.preferred_maintenance_window
  promotion_tier               = var.promotion_tier
  tags                         = var.tags

  lifecycle {
    prevent_destroy = true
  }
}