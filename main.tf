resource "oci_database_db_home" "database_db_homes" {
  for_each = var.database_db_homes

  database_software_image_id  = each.value.database_software_image_id
  db_system_id                = each.value.db_system_id
  db_version                  = each.value.db_version
  defined_tags                = each.value.defined_tags
  display_name                = each.value.display_name
  enable_database_delete      = each.value.enable_database_delete
  freeform_tags               = each.value.freeform_tags
  home_type                   = each.value.home_type
  is_desupported_version      = each.value.is_desupported_version
  is_unified_auditing_enabled = each.value.is_unified_auditing_enabled
  kms_key_id                  = each.value.kms_key_id
  kms_key_version_id          = each.value.kms_key_version_id
  source                      = each.value.source
  vm_cluster_id               = each.value.vm_cluster_id

  dynamic "database" {
    for_each = each.value.database != null ? [each.value.database] : []
    content {
      admin_password             = database.value.admin_password
      backup_id                  = database.value.backup_id
      backup_tde_password        = database.value.backup_tde_password
      character_set              = database.value.character_set
      database_id                = database.value.database_id
      database_software_image_id = database.value.database_software_image_id
      dynamic "db_backup_config" {
        for_each = database.value.db_backup_config != null ? [database.value.db_backup_config] : []
        content {
          auto_backup_enabled     = db_backup_config.value.auto_backup_enabled
          auto_backup_window      = db_backup_config.value.auto_backup_window
          auto_full_backup_day    = db_backup_config.value.auto_full_backup_day
          auto_full_backup_window = db_backup_config.value.auto_full_backup_window
          backup_deletion_policy  = db_backup_config.value.backup_deletion_policy
          dynamic "backup_destination_details" {
            for_each = db_backup_config.value.backup_destination_details != null ? db_backup_config.value.backup_destination_details : []
            content {
              backup_retention_policy_on_terminate = backup_destination_details.value.backup_retention_policy_on_terminate
              dbrs_policy_id                       = backup_destination_details.value.dbrs_policy_id
              id                                   = backup_destination_details.value.id
              is_remote                            = backup_destination_details.value.is_remote
              is_retention_lock_enabled            = backup_destination_details.value.is_retention_lock_enabled
              remote_region                        = backup_destination_details.value.remote_region
              dynamic "tde_wallet_backup_destination" {
                for_each = backup_destination_details.value.tde_wallet_backup_destination != null ? [backup_destination_details.value.tde_wallet_backup_destination] : []
                content {
                  backup_destination_id   = tde_wallet_backup_destination.value.backup_destination_id
                  backup_destination_type = tde_wallet_backup_destination.value.backup_destination_type
                }
              }
              type         = backup_destination_details.value.type
              vpc_password = backup_destination_details.value.vpc_password
              vpc_user     = backup_destination_details.value.vpc_user
            }
          }
          recovery_window_in_days   = db_backup_config.value.recovery_window_in_days
          run_immediate_full_backup = db_backup_config.value.run_immediate_full_backup
        }
      }
      db_name      = database.value.db_name
      db_workload  = database.value.db_workload
      defined_tags = database.value.defined_tags
      dynamic "encryption_key_location_details" {
        for_each = database.value.encryption_key_location_details != null ? [database.value.encryption_key_location_details] : []
        content {
          aws_encryption_key_id                   = encryption_key_location_details.value.aws_encryption_key_id
          azure_encryption_key_id                 = encryption_key_location_details.value.azure_encryption_key_id
          google_cloud_provider_encryption_key_id = encryption_key_location_details.value.google_cloud_provider_encryption_key_id
          hsm_password                            = encryption_key_location_details.value.hsm_password
          provider_type                           = encryption_key_location_details.value.provider_type
        }
      }
      freeform_tags                   = database.value.freeform_tags
      key_store_id                    = database.value.key_store_id
      kms_key_id                      = database.value.kms_key_id
      kms_key_version_id              = database.value.kms_key_version_id
      ncharacter_set                  = database.value.ncharacter_set
      pdb_name                        = database.value.pdb_name
      pluggable_databases             = database.value.pluggable_databases
      recovery_appliance_vpc_password = database.value.recovery_appliance_vpc_password
      dynamic "storage_size_details" {
        for_each = database.value.storage_size_details != null ? [database.value.storage_size_details] : []
        content {
          data_storage_size_in_gb  = storage_size_details.value.data_storage_size_in_gb
          reco_storage_size_in_gbs = storage_size_details.value.reco_storage_size_in_gbs
        }
      }
      tde_wallet_password                   = database.value.tde_wallet_password
      time_stamp_for_point_in_time_recovery = database.value.time_stamp_for_point_in_time_recovery
      vault_id                              = database.value.vault_id
      vm_cluster_id                         = database.value.vm_cluster_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

