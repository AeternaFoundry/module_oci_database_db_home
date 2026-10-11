variable "database_db_homes" {
  description = <<EOT
Map of database_db_homes, attributes below
Optional:
    - database_software_image_id
    - db_system_id
    - db_version
    - defined_tags
    - display_name
    - enable_database_delete
    - freeform_tags
    - home_type
    - is_desupported_version
    - is_unified_auditing_enabled
    - kms_key_id
    - kms_key_version_id
    - source
    - vm_cluster_id
    - database (block):
        - admin_password (required)
        - backup_id (optional)
        - backup_tde_password (optional)
        - character_set (optional)
        - database_id (optional)
        - database_software_image_id (optional)
        - db_backup_config (optional, block):
            - auto_backup_enabled (optional)
            - auto_backup_window (optional)
            - auto_full_backup_day (optional)
            - auto_full_backup_window (optional)
            - backup_deletion_policy (optional)
            - backup_destination_details (optional, block):
                - backup_retention_policy_on_terminate (optional)
                - dbrs_policy_id (optional)
                - id (optional)
                - is_remote (optional)
                - is_retention_lock_enabled (optional)
                - remote_region (optional)
                - tde_wallet_backup_destination (optional, block):
                    - backup_destination_id (optional)
                    - backup_destination_type (optional)
                - type (optional)
                - vpc_password (optional)
                - vpc_user (optional)
            - recovery_window_in_days (optional)
            - run_immediate_full_backup (optional)
        - db_name (optional)
        - db_workload (optional)
        - defined_tags (optional)
        - encryption_key_location_details (optional, block):
            - aws_encryption_key_id (optional)
            - azure_encryption_key_id (optional)
            - google_cloud_provider_encryption_key_id (optional)
            - hsm_password (optional)
            - provider_type (required)
        - freeform_tags (optional)
        - key_store_id (optional)
        - kms_key_id (optional)
        - kms_key_version_id (optional)
        - ncharacter_set (optional)
        - pdb_name (optional)
        - pluggable_databases (optional)
        - recovery_appliance_vpc_password (optional)
        - storage_size_details (optional, block):
            - data_storage_size_in_gb (required)
            - reco_storage_size_in_gbs (required)
        - tde_wallet_password (optional)
        - time_stamp_for_point_in_time_recovery (optional)
        - vault_id (optional)
        - vm_cluster_id (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    database_software_image_id  = optional(string)
    db_system_id                = optional(string)
    db_version                  = optional(string)
    defined_tags                = optional(map(string))
    display_name                = optional(string)
    enable_database_delete      = optional(bool)
    freeform_tags               = optional(map(string))
    home_type                   = optional(string)
    is_desupported_version      = optional(bool)
    is_unified_auditing_enabled = optional(bool)
    kms_key_id                  = optional(string)
    kms_key_version_id          = optional(string)
    source                      = optional(string)
    vm_cluster_id               = optional(string)
    database = optional(object({
      admin_password             = string
      backup_id                  = optional(string)
      backup_tde_password        = optional(string)
      character_set              = optional(string)
      database_id                = optional(string)
      database_software_image_id = optional(string)
      db_backup_config = optional(object({
        auto_backup_enabled     = optional(bool)
        auto_backup_window      = optional(string)
        auto_full_backup_day    = optional(string)
        auto_full_backup_window = optional(string)
        backup_deletion_policy  = optional(string)
        backup_destination_details = optional(list(object({
          backup_retention_policy_on_terminate = optional(string)
          dbrs_policy_id                       = optional(string)
          id                                   = optional(string)
          is_remote                            = optional(bool)
          is_retention_lock_enabled            = optional(bool)
          remote_region                        = optional(string)
          tde_wallet_backup_destination = optional(object({
            backup_destination_id   = optional(string)
            backup_destination_type = optional(string)
          }))
          type         = optional(string)
          vpc_password = optional(string)
          vpc_user     = optional(string)
        })))
        recovery_window_in_days   = optional(number)
        run_immediate_full_backup = optional(bool)
      }))
      db_name      = optional(string)
      db_workload  = optional(string)
      defined_tags = optional(map(string))
      encryption_key_location_details = optional(object({
        aws_encryption_key_id                   = optional(string)
        azure_encryption_key_id                 = optional(string)
        google_cloud_provider_encryption_key_id = optional(string)
        hsm_password                            = optional(string)
        provider_type                           = string
      }))
      freeform_tags                   = optional(map(string))
      key_store_id                    = optional(string)
      kms_key_id                      = optional(string)
      kms_key_version_id              = optional(string)
      ncharacter_set                  = optional(string)
      pdb_name                        = optional(string)
      pluggable_databases             = optional(list(string))
      recovery_appliance_vpc_password = optional(string)
      storage_size_details = optional(object({
        data_storage_size_in_gb  = number
        reco_storage_size_in_gbs = number
      }))
      tde_wallet_password                   = optional(string)
      time_stamp_for_point_in_time_recovery = optional(string)
      vault_id                              = optional(string)
      vm_cluster_id                         = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.database_db_homes : (
        v.database == null || (v.database.encryption_key_location_details == null || (contains([for v in ["AWS", "AZURE", "EXTERNAL", "GCP"] : lower(v)], lower(v.database.encryption_key_location_details.provider_type))))
      )
    ])
    error_message = "must be one of: \"AWS\", \"AZURE\", \"EXTERNAL\", \"GCP\""
  }
  validation {
    condition = alltrue([
      for k, v in var.database_db_homes : (
        v.source == null || (contains([for v in ["DATABASE", "DB_BACKUP", "NONE", "VM_CLUSTER_BACKUP", "VM_CLUSTER_DATABASE", "VM_CLUSTER_NEW"] : lower(v)], lower(v.source)))
      )
    ])
    error_message = "must be one of: \"DATABASE\", \"DB_BACKUP\", \"NONE\", \"VM_CLUSTER_BACKUP\", \"VM_CLUSTER_DATABASE\", \"VM_CLUSTER_NEW\""
  }
}

