#########################################
# AWS Rule Plugin
#########################################
plugin "aws" {
  enabled = true
  version = "0.35.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

#########################################
# CORE TERRAFORM RULE CONFIG (VALID)
#########################################

# Disable noisy minor warnings
rule "terraform_unused_declarations" {
  enabled = false
}

rule "terraform_module_pinned_source" {
  enabled = true        # Enterprise: require pinning sources
  severity = "ERROR"
}

# Enterprise: enforce typed variables
rule "terraform_typed_variables" {
  enabled = true
  severity = "ERROR"
}

# Enterprise: require explicit provider version pinning
rule "terraform_required_providers" {
  enabled = true
  severity = "ERROR"
}

#########################################
# TFLINT v0.54+ CONFIG (CRITICAL)
#########################################
# Allowed: all, local, none
config {
  call_module_type = "all"
}