# docdb_cluster variables

variable "master_username" {
  type        = string
  sensitive   = true
}

variable "master_password" {
  type        = string
  sensitive   = true
}

variable "apply_immediately" {
  type        = bool
}

variable "availability_zones" {
  type        = list(string)
}

variable "backup_retention_period" {
  type        = number
}

variable "cluster_identifier" {
  type        = string
}

variable "db_subnet_group_name" {
  type        = string
}

variable "db_cluster_parameter_group_name" {
  type        = string
}

variable "deletion_protection" {
  type        = bool
}

variable "enabled_cloudwatch_logs_exports" {
  type        = string
}

variable "engine_version" {
  type        = number
}

variable "engine" {
  type        = string
}

variable "final_snapshot_identifier" {
  type        = string
}
variable "global_cluster_identifier" {
  type        = string
}






variable "kms_key_id" {
  type = string
}

variable "port" {
  type        = number
}

variable "preferred_backup_window" {
  type        = string
}


variable "preferred_maintenance_window" {
  type        = string
}

variable "skip_final_snapshot" {
  type        = string
}

variable "snapshot_identifier" {
  type        = string
}

variable "storage_encrypted" {
  type        = bool
  default     = true
}

variable "tags" {
  type        = map(string)
}

variable "vpc_security_group_ids" {
  type        = string
}

# docdb_cluster_instance variables

variable "instances" {
  type        = number
}

variable "identifier" {
  type        = string
}

variable "instance_class" {
  type        = string
}
