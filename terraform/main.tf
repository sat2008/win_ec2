#Mytag modules cretae server name "LP_change3"
module "tags" {
  source          = "git::ssh://git@github.com/sat2008/git_modules.git//tags"
  tag_environment = "sg"
  tag_suffix      = "zg"
  tag_service     = "inc"
  tag_build       = "manual"
  tag_version     = "0.0.1"
  tag_owner       = "Soner"
  tag_description = "SG-Infra"
  tag_role        = "Infra"
  tag_application = "SG-Boss"

}

#Mytag modules cretae server name "back to my joy"
module "iam" {
  source = "git::ssh://git@github.com/sat2008/git_modules.git//iam"

  # providers = {
  #   aws = aws.terra
  # }

  tags = module.tags.tags.name
}
#security group  "sg"
module "sg" {
  source = "git::ssh://git@github.com/sat2008/git_modules.git//sg"

  vpc_id = data.aws_vpc.existing.id

  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
  tags          = module.tags.tags.name
}

# create key name 
module "key" {
  source       = "git::ssh://git@github.com/sat2008/git_modules.git//key"
  key_out_path = "${path.root}/terraform/key.pem"
  # providers = {
  #   aws = aws.terra **Newdddd"
  # }
  tags = module.tags
}

module "windows_ec2" {
  source      = "git::ssh://git@github.com/sat2008/git_modules.git//ec2-win"
  server_name = "tec"
  # providers = {
  #   aws = aws.terra
  # }
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = data.aws_subnets.private.ids[0] # pick first private
  #vpc_id             = data.aws_vpc.existing.id
  key               = module.key
  tags              = module.tags
  additional_disks  = var.additional_disks
  instance_profile  = module.iam.instance_profile #ssm role attahed
  security_group_id = module.sg.security_group_id #tolist([module.son_sg.id]) tolist([module.son_sg.id])
  #ebs_size                    = var.ebs_size
  deletion_protection         = false #var.ec2s.win01.deletion_protection
  associate_public_ip_address = false
  root_size                   = var.root_size
}
