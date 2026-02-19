#########################################
# AWS RULESET PLUGIN
#########################################
plugin "aws" {
  enabled = true
  version = "0.35.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

#########################################
# TERRAFORM CORE RULE SETTINGS
#########################################

# Disable noisy minor warnings
rule "terraform_unused_declarations" {
  enabled = false
}

# This rule DOES NOT support severity (TFLint limitation)
rule "terraform_module_pinned_source" {
  enabled = true
}

# Enforce typed variables (supports severity)
rule "terraform_typed_variables" {
  enabled  = true
  severity = "ERROR"
}

# Enforce provider version pinning (supports severity)
rule "terraform_required_providers" {
  enabled  = true
  severity = "ERROR"
}

#########################################
# TFLINT v0.54+ CONFIG (MANDATORY)
#########################################
# Allowed values: all, local, none
config {
  call_module_type = "all"
}