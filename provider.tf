provider "aws" {
  region  = var.region
  profile = var.profile 
  alias = "terra"    # need for deploymnet provide block under resource
}