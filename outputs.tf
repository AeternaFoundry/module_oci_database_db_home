output "database_db_homes_id" {
  description = "Map of id values across all database_db_homes, keyed the same as var.database_db_homes except keys with no id are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "database_db_homes_compartment_id" {
  description = "Map of compartment_id values across all database_db_homes, keyed the same as var.database_db_homes except keys with no compartment_id are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "database_db_homes_database" {
  description = "Map of database values across all database_db_homes, keyed the same as var.database_db_homes except keys with no database are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => one(v.database) if v.database != null && length(v.database) > 0 }
  sensitive   = true
}
output "database_db_homes_database_software_image_id" {
  description = "Map of database_software_image_id values across all database_db_homes, keyed the same as var.database_db_homes except keys with no database_software_image_id are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.database_software_image_id if v.database_software_image_id != null && length(v.database_software_image_id) > 0 }
}
output "database_db_homes_db_home_location" {
  description = "Map of db_home_location values across all database_db_homes, keyed the same as var.database_db_homes except keys with no db_home_location are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.db_home_location if v.db_home_location != null && length(v.db_home_location) > 0 }
}
output "database_db_homes_db_system_id" {
  description = "Map of db_system_id values across all database_db_homes, keyed the same as var.database_db_homes except keys with no db_system_id are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.db_system_id if v.db_system_id != null && length(v.db_system_id) > 0 }
}
output "database_db_homes_db_version" {
  description = "Map of db_version values across all database_db_homes, keyed the same as var.database_db_homes except keys with no db_version are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.db_version if v.db_version != null && length(v.db_version) > 0 }
}
output "database_db_homes_defined_tags" {
  description = "Map of defined_tags values across all database_db_homes, keyed the same as var.database_db_homes except keys with no defined_tags are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "database_db_homes_display_name" {
  description = "Map of display_name values across all database_db_homes, keyed the same as var.database_db_homes except keys with no display_name are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "database_db_homes_enable_database_delete" {
  description = "Map of enable_database_delete values across all database_db_homes, keyed the same as var.database_db_homes except keys with no enable_database_delete are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.enable_database_delete if v.enable_database_delete != null }
}
output "database_db_homes_freeform_tags" {
  description = "Map of freeform_tags values across all database_db_homes, keyed the same as var.database_db_homes except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "database_db_homes_home_type" {
  description = "Map of home_type values across all database_db_homes, keyed the same as var.database_db_homes except keys with no home_type are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.home_type if v.home_type != null && length(v.home_type) > 0 }
}
output "database_db_homes_is_desupported_version" {
  description = "Map of is_desupported_version values across all database_db_homes, keyed the same as var.database_db_homes except keys with no is_desupported_version are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.is_desupported_version if v.is_desupported_version != null }
}
output "database_db_homes_is_unified_auditing_enabled" {
  description = "Map of is_unified_auditing_enabled values across all database_db_homes, keyed the same as var.database_db_homes except keys with no is_unified_auditing_enabled are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.is_unified_auditing_enabled if v.is_unified_auditing_enabled != null }
}
output "database_db_homes_kms_key_id" {
  description = "Map of kms_key_id values across all database_db_homes, keyed the same as var.database_db_homes except keys with no kms_key_id are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.kms_key_id if v.kms_key_id != null && length(v.kms_key_id) > 0 }
}
output "database_db_homes_kms_key_version_id" {
  description = "Map of kms_key_version_id values across all database_db_homes, keyed the same as var.database_db_homes except keys with no kms_key_version_id are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.kms_key_version_id if v.kms_key_version_id != null && length(v.kms_key_version_id) > 0 }
}
output "database_db_homes_last_patch_history_entry_id" {
  description = "Map of last_patch_history_entry_id values across all database_db_homes, keyed the same as var.database_db_homes except keys with no last_patch_history_entry_id are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.last_patch_history_entry_id if v.last_patch_history_entry_id != null && length(v.last_patch_history_entry_id) > 0 }
}
output "database_db_homes_lifecycle_details" {
  description = "Map of lifecycle_details values across all database_db_homes, keyed the same as var.database_db_homes except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "database_db_homes_source" {
  description = "Map of source values across all database_db_homes, keyed the same as var.database_db_homes except keys with no source are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.source if v.source != null && length(v.source) > 0 }
}
output "database_db_homes_state" {
  description = "Map of state values across all database_db_homes, keyed the same as var.database_db_homes except keys with no state are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.state if v.state != null && length(v.state) > 0 }
}
output "database_db_homes_system_tags" {
  description = "Map of system_tags values across all database_db_homes, keyed the same as var.database_db_homes except keys with no system_tags are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "database_db_homes_time_created" {
  description = "Map of time_created values across all database_db_homes, keyed the same as var.database_db_homes except keys with no time_created are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "database_db_homes_vm_cluster_id" {
  description = "Map of vm_cluster_id values across all database_db_homes, keyed the same as var.database_db_homes except keys with no vm_cluster_id are omitted"
  value       = { for k, v in oci_database_db_home.database_db_homes : k => v.vm_cluster_id if v.vm_cluster_id != null && length(v.vm_cluster_id) > 0 }
}

