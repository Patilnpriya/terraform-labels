#Module      : LABEL
#Description : Terraform label module variables.
variable "app_id" {
  type        = string
  default     = ""
  description = "ID  (e.g. `12345`)."
}

variable "app_name" {
  type        = string
  default     = ""
  description = "Application Name (e.g. `CCTA` or `Kano`)."
}
variable "platform" {
  type        = string
  default     = ""
  description = "e.g.Simplify."
}
variable "squadname" {
  type        = string
  default     = ""
  description = "Squad Name (e.g. `DevOps`)."
}
variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}
variable "label_order" {
  type        = list
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "attributes" {
  type        = list
  default     = []
  description = "Additional attributes (e.g. `1`)."
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}
variable "managedby" {
  type        = string
  default     = ""
  description = "ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'."
}
variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources."
  default     = true
}
variable "delimiter" {
  type        = string
  default     = "_"
  description = "Delimiter to be used between `organization`, `name`, `environment` and `attributes`."
}
