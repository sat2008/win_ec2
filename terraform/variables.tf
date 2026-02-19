# variable "vpc_id" {
#   description = "Existing VPC ID to deploy EC2 into"
#   type        = string
# }

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "profile" {
  type    = string
  default = null
}

variable "additional_disks" {
  description = "Optional additional EBS disks"
  type = list(object({
    device_name = string
    size        = number
    type        = string
    iops        = number
    throughput  = number
  }))
  default = []
}

# Security Groups
variable "ingress_rules" { type = list(any) }
variable "egress_rules" { type = list(any) }

#variable "server_name" {}
#variable "security_group_ids" {}
#variable "subnet_id" {}
#variable "tags" {}
#variable "instance_profile" {}
variable "instance_type" {
  #default = "t2.micro"
}
variable "ami" {type = string}
#variable "key" {}
variable "root_size" {}
#variable "kms" {}
#variable "kms_ebs" {}