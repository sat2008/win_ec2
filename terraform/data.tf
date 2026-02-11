# --------------------------------------------------
# Look up existing VPC by ID or Name *****
# --------------------------------------------------
data "aws_vpc" "existing" {
  id = "vpc-013f436261a3d2c8a"  # filter by Name tag
  # OR use filter:
  # filter {
  #   name   = "tag:Name"
  #   values = [var.vpc_name]
  # }
   provider = aws.terra
  
}

# --------------------------------------------------
# Look up existing public subnets
# --------------------------------------------------
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
    
  }

  filter {
    name   = "tag:Name"
    values = ["dev-public-0"]  # if you tag subnets as Public/Private
  }
  provider = aws.terra
}

# --------------------------------------------------
# Look up existing private subnets
# --------------------------------------------------
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }

  filter {
    name   = "tag:Name"
    values = ["*private*"]  # if you tag subnets as Public/Private
  }
  provider = aws.terra
}

# data "aws_kms_key" "ebs" {
#     provider = aws.sg
#     key_id = var.kms_ebs
# }