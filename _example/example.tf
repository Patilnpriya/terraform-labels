module "labels" {
  source = "https://github.com/Patilnpriya/terraform-labels"

  Application_id        = var.app_id
  Application_name      = var.app_name
  Platform_name         = var.platform
  OWNER                 = var.squadname
  Environment           = var.env
  Managed_by            = var.managedby
  label_order = ["Application_id", "Application_name","Platform_name","OWNER","Environment","Managed_by"]
}
