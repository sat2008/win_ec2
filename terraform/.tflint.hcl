plugin "aws" {
  enabled = true
  version = "0.34.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

plugin "azurerm" {
  enabled = true
  version = "0.33.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

config {
  module      = false
  call_module_type = "all"
  force       = false
}

# ---------------------------
# Terraform Built-In Ruleset
# ---------------------------
rule "terraform_required_providers" {
  enabled = true
}

rule "terraform_module_pinned_source" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_typed_variables" {
  enabled = true
}

# --------------------------------
# Plugin Rules — severity allowed
# --------------------------------
rule "aws_instance_invalid_type" {
  enabled  = true
  severity = "ERROR"
}

rule "azurerm_resource_group_default_location" {
  enabled  = true
  severity = "ERROR"
}