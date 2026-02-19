region      = "eu-west-2"
#environment = "dev"
profile = "terra"  

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

