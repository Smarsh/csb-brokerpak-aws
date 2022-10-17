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

# shared varibles between docdb_cluser & docdb_cluster_instances

variable "cluster_identifier" {
  description = "(Required) Forces new resources) The cluster identifier. If omitted, Terraform will assign a random, unique identifier."
  type        = string
  default     = ""
}

variable "preferred_maintenance_window" {
  description = "(Optional) The weekly time range during which system maintenance can occur, in (UTC) e.g., wed:04:00-wed:04:30"
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the DB cluster. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
}

# docdb_cluster variables

variable "db_subnet_group_name" {
  description = "(Optional) A DB subnet group to associate with this DB instance"
  type        = string
}

variable "db_cluster_parameter_group_name" {
  description = "(Optional) A cluster parameter group to associate with the cluster."
  type        = string
}

variable "deletion_protection" {
  description = "(Optional) A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled"
  type        = bool
  default     = true
}

variable "enabled_cloudwatch_logs_exports" {
  description = "(Optional) List of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, profiler."
  type        = string
}

variable "engine_version" {
  description = "(Optional) The database engine version. Updating this argument results in an outage."
  type        = number
}

variable "final_snapshot_identifier" {
  description = "(Optional) The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made"
  type        = string
  default     = ""
}

variable "master_password" {
  description = "(Required) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Please refer to the DocDB Naming Constraints"
  type        = string
  default     = ""
  sensitive   = true
}

variable "master_username" {
  description = "(Required) Username for the master DB user"
  type        = string
  default     = ""
  sensitive   = true
}

variable "port" {
  description = "(Optional) The port on which the DB accepts connections."
  type        = number
}

variable "preferred_backup_window" {
  description = "(Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.Time in UTC Default: A 30-minute window selected at random from an 8-hour block of time per regionE.g., 04:00-09:00"
  type        = string
}

variable "snapshot_identifier" {
  description = "(Optional) Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot."
  type        = string
}

variable "storage_encrypted" {
  description = "(Optional) Specifies whether the DB cluster is encrypted. The default is false"
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "(Optional) List of VPC security groups to associate with the Cluster"
  type        = string
}

# docdb_cluster_instance variables

variable "instances" {
  description = "The nuber of cluster instances to be created in the cluster"
  type        = number
}

variable "identifier" {
  description = "(Optional, Forces new resource) The identifier for the DocDB instance, if omitted, Terraform will assign a random, unique identifier."
  type        = string
}

variable "instance_class" {
  description = "(Required) The instance class to use. For details on CPU and memory, see Scaling for DocDB Instances.  Please see AWS Documentation for complete details regarding instance types available for documentdb"
  type        = string
}
