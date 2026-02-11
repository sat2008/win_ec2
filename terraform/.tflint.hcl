plugin "aws" {
  enabled = true
  version = ">=0.64.0"
}

rule "terraform_unused_declarations" {
  enabled = false
}

rule "terraform_module_pinned_source" {
  enabled = false
}

rule "terraform_typed_variables" {
  enabled = true
  severity = "ERROR"
}

rule "terraform_deprecated_resource" {
  enabled  = true
  severity = "ERROR"
}
