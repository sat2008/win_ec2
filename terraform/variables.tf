# variable "vpc_id" {
#   description = "Existing VPC ID to deploy EC2 into"
#   type        = string
# }

variable "region" {
  type    = string
  default = "eu-west-2"
}

# variable "profile" {
#   type    = string
#   default = null
# }

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
  type        = string
  description = "EC2 instance type"

  validation {
    condition     = contains(["t3.micro","t3.small","m5.large"], var.instance_type)
    error_message = "Invalid instance type."
  }

  default = "t3.micro"
}
variable "ami" {type = string}
#variable "key" {}
variable "root_size" {
  type    = number
  default = null
}
#variable "kms" {}
#variable "kms_ebs" {}