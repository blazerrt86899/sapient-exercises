locals {
  owners               = "HR"
  environment          = "dev"
  resource_name_prefix = "${local.owners}-${local.environment}"
  common_tags = {
    creator     = local.owners
    environment = local.environment
  }
}