## Managed By : CloudDrove
## Copyright @ CloudDrove. All Right Reserved.

#Module      : locals
#Description : This terraform module is designed to generate consistent label names and tags #              for resources. You can use terraform-labels to implement a strict naming #              convention.
locals {
  enabled = var.enabled == true ? true : false
  id_context = {
    application_id        = var.app_id
    application_name      = var.app_name
    platform_name         = var.platform
    owner                 = var.squadname
    environment           = var.env
    managed_by            = var.managedby
  }

  # run loop for label order and set in value.
  id_labels = [for l in var.label_order : local.id_context[l] if length(local.id_context[l]) > 0]

  id                        = lower(join(var.delimiter, local.id_labels, var.attributes))
  application_id            = local.enabled == true ? lower(format("%v", var.app_id)) : ""
  application_name          = local.enabled == true ? lower(format("%v", var.app_name)) : ""
  platform_name             = local.enabled == true ? lower(format("%v", var.platform)) : ""
  owner                     = local.enabled == true ? lower(format("%v", var.squadname)) : ""
  environment               = local.enabled == true ? lower(format("%v", var.env)) : ""
  managed_by                = local.enabled == true ? lower(format("%v", var.managedby)) : ""
  attributes  = local.enabled == true ? lower(format("%v", join(var.delimiter, compact(var.attributes)))) : ""

  # Merge input tags with our tags.
  # Note: `Name` has a special meaning in AWS and we need to disamgiuate it by using the computed `id`
  tags = merge(
    {
     "Name"                     = local.id
      "Application_ID"           = local.application_id
      "Application_Name"         = local.application_name
      "Environment_Type"         = local.environment
      "Platform"                 = local.platform_name
      "Owner"                    = local.owner
      "ManagedBy"                = local.managed_by
    },
    var.tags
  )
}
