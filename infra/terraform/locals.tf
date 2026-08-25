locals {
  platform_context = {
    environment = var.environment
    managed_by  = "terraform"
    platform    = var.platform_name
  }
}
