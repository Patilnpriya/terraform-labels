module "labels" {
  source = "https://github.com/Patilnpriya/terraform-labels"

  application_id        = var.app_id
  application_name      = var.app_name
  platform_name         = var.platform
          owner         = var.squadname
  environment           = var.env
  managed_by            = var.managedby
  label_order = ["application_id", "application_name","platform_name","owner","environment","managed_by"]
}
