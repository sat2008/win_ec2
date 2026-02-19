plugin "aws" {
  enabled = true
  version = "0.35.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

# Ignore minor warnings
rule "terraform_unused_declarations" {
  enabled = false
}

rule "terraform_module_pinned_source" {
  enabled = false
}

# Fail workflow for critical rules
rule "terraform_typed_variables" {
  enabled = true
  severity = "ERROR"
}

rule "terraform_deprecated_resource" {
  enabled  = true
  severity = "ERROR"
}

# Enable module scanning
config {
  call_module_type = "terraform"
}