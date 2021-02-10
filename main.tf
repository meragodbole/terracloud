terraform {
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = "1.0.0"
    }
  }
}

provider "intersight" {
  apikey = var.api_key
  secretkey = var.secretkey
  endpoint = var.endpoint
}

resource "intersight_sol_policy" "sol1" {
  name      = "sol2"
  enabled   = true 
  baud_rate = 9600
  com_port  = "com1"
  ssh_port  = 1098
  organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.default_org.moid 
  }
}

data "intersight_organization_organization" "default_org" {
  name="default"
}

