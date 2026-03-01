##### US EAST 1 #######
vpc_id = "vpc-00b1d754e3dcf565d"  # us-east-1
region      = "us-east-1"

  ##### EU WEST 2  London #######
#vpc_id =  "vpc-013f436261a3d2c8a" # eu-west-1 
#region      = "eu-west-2" # "us-east-1"

#environment = "dev"
#profile = "terra"  

ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

instance_type  = "t3.micro"
ami        = "ami-05d5ef92e8653e623"
#key       = "my-keypair"
root_size = "40"

