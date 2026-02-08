module "tags" {
  #source          = "../../../modules/tags"
  #source = "github.com/sat2008/git_modules//tags"
  source          = "git::https://oauth2:${var.git_pat}@github.com/sat2008/git_modules.git//tags"
  tag_environment = "sg"
  tag_suffix      = "zg"
  tag_service     = "inc"
  tag_build       = "manual"
  tag_version     = "0.0.1"
  tag_owner       = "Soner"
  tag_description = "SG-Infra"
  tag_role        = "Infra"
  tag_application = "SG-BaseInfrastructure"

}

module "iam" {
  #source = "../../../modules/iam"
  #source = "github.com/sat2008/git_modules//iam"
  source = "git::https://oauth2:${var.git_pat}@github.com/sat2008/git_modules.git//iam"
  providers = {
    aws = aws.terra
  }

  tags = module.tags
}

module "sg" {
  #source = "../../../modules/sg"
  #source = "github.com/sat2008/git_modules//sg"
  source = "git::https://oauth2:${var.git_pat}@github.com/sat2008/git_modules.git//sg"
  providers = {
    aws = aws.terra
  }

  vpc_id = data.aws_vpc.existing.id

  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
  tags          = module.tags
}

module "key" {
  #source = "../../../modules/key"
  #source = "github.com/sat2008/git_modules//key"
  source = "git::https://oauth2:${var.git_pat}@github.com/sat2008/git_modules.git//key"
  providers = {
    aws = aws.terra
  }
  tags = module.tags
  #kms  = data.aws_kms_key.ebs
}

module "windows_ec2" {
  #source      = "../../../modules/ec2-win"
  #source = "github.com/sat2008/git_modules//ec2-win"
  source      = "git::https://oauth2:${var.git_pat}@github.com/sat2008/git_modules.git//ec2-win"
  server_name = "gitt"
  providers = {
    aws = aws.terra
  }
  #environment        = var.environment
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = data.aws_subnets.private.ids[0] # pick first private subnet
  #vpc_id             = data.aws_vpc.existing.id
  key               = module.key
  tags              = module.tags
  additional_disks  = var.additional_disks
  instance_profile  = module.iam.instance_profile
  security_group_id = module.sg.security_group_id #tolist([module.son_sg.id]) tolist([module.son_sg.id])
  #ebs_size                    = var.ebs_size
  deletion_protection         = false #var.ec2s.win01.deletion_protection
  associate_public_ip_address = false
  root_size                   = var.root_size
}
