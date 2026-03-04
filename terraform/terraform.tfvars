##### US EAST 1 #######
# vpc_id = "vpc-00b1d754e3dcf565d" # us-east-1
# region = "us-east-1"

##### EU WEST 2  London #######
vpc_id = "vpc-013f436261a3d2c8a" # eu-west-1 
region = "eu-west-2"             # "us-east-1"

#environment = "dev"
#profile = "terra"  

ingress_rules = [
  {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules = [
  {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

instance_type = "t3.micro"
ami           = "ami-0ec9cfdee93464c02" # eu-wast-2  aim win2025  
#ami           = "ami-031283482dcfced88" #"us-west-1 aim win2025
root_size = "40"

