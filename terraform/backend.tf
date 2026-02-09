    
terraform {
  backend "s3" {
    bucket         = "terraform-state-repo-sg"
    key            = "git/winec2/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}