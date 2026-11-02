terraform {
  # Enforce the current enterprise-supported major release line
  required_version = ">= 1.17.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.71.0" # Pinned to the current stable production release
    }
  }
}
