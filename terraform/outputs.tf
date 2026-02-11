
#outputs the subnet used "LapTop2"
output "available_private_subnets" {
  value = data.aws_subnets.private.ids
}