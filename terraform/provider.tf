# provider "aws" {
#   region  = var.region
#   profile = var.profile 
#   alias = "terra"    # need for deploymnet provide block under resource
# }

provider "aws" {
  region = var.region
}
provider "aws" {
  alias  = "terra"
  region = var.region
}
# provider "aws" {
#   alias  = "terra"
#   region = var.region

#   assume_role {
#     role_arn = "arn:aws:iam::508261694247:role/Terra_user_role" # var.terra_role_arn
#   }
# }