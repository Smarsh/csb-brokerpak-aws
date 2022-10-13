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

output "access_key_id" {
  value     = aws_iam_access_key.access_key.id
  sensitive = true
}
output "secret_access_key" {
  value     = aws_iam_access_key.access_key.secret
  sensitive = true
}
output "docdb_cluster_arn" { value = var.docdb_cluster_arn }
output "docdb_cluster_members" { value = var.docdb_cluster_members }
output "docdb_cluster_resource_id" { value = var.docdb_cluster_resource_id }
output "docdb_cluster_endpoint" { value = var.docdb_cluster_endpoint }
output "docdb_cluster_hosted_zone_id" { value = var.docdb_cluster_hosted_zone_id }
output "docdb_cluster_id" { value = var.docdb_cluster_id }
output "docdb_cluster_reader_endpoint" { value = var.docdb_cluster_reader_endpoint }
output "docdb_cluster_tags_all" { value = var.docdb_cluster_tags_all }
output "region" { value = var.region }