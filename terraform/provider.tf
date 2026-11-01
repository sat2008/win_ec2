
# provider "aws" {
#   alias  = "terra"  
#   region = var.region
# }
provider "aws" {
  alias  = "terra" 
  region = var.region
  profile = "terra"
  assume_role {
    role_arn = "arn:aws:iam::508261694247:role/Terra_user_role" # var.terra_role_arn
  }
}