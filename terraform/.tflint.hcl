#########################################
# AWS RULESET PLUGIN
#########################################
plugin "aws" {
  enabled = true
  version = "0.34.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

#########################################
# AZURE RULESET PLUGIN
#########################################
plugin "azurerm" {
  enabled = true
  version = "0.33.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

#########################################
# TFLINT CONFIG (v0.54+)
#########################################
config {
  call_module_type = "all"  # Required replacement for old "module"
  force            = false
}

#########################################
# CORE TERRAFORM RULES (built-in)
#########################################
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

#########################################
# PLUGIN RULES — severity allowed
#########################################
rule "aws_instance_invalid_type" {
  enabled  = true
  severity = "ERROR"
}

rule "azurerm_resource_group_default_location" {
  enabled  = true
  severity = "ERROR"
}