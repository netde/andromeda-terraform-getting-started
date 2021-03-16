# Configure OpenStack Provider and set required terraform version.
terraform {
  required_version     = ">= 0.14"

  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "1.33.0"
    }
  }
}

# Authenticate
provider "openstack" {
  auth_url            = var.auth_url
  domain_name         = var.domain_name
  user_name           = var.username
  region              = var.region
  tenant_name         = var.project_name
  password            = var.password
}
