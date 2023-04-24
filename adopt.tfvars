# General resources
env = "dev"
aws_region ="us-east-1"
tags = {
  environment = "Dev"
  source      = "Terraform"
  department  = "Infrastructure"
  costCenter  = "IT"
  kickoff     = "true"
}
# AWS resources
vpc = {
  name          = "lab01"
  address_space = "10.0.0.0/23"
}
subnet = {
  private = ["10.0.1.0/27", "10.0.1.32/27", "10.0.1.64/27"]
}
availability_zone = ["us-east-1a", "us-east-1b", "us-east-1c"]
instance = {
  aws1 = {
    ami       = "ami-0cc87e5027adcdca8"
    type      = "t2.large"
    key_name  = "testKey"
    subnet_id = "0"
  }
  aws2 = {
    ami       = "ami-0cc87e5027adcdca8"
    type      = "t2.large"
    key_name  = "testKey"
    subnet_id = "1"
  }
  aws3 = {
    ami       = "ami-0cc87e5027adcdca8"
    type      = "t2.large"
    key_name  = "testKey"
    subnet_id = "2"
  }
}
aws_security_groups = {
  private = {
    name        = "allow_private"
    description = "Allow HTTP inbound traffic on private subnets"
  }
}

aws_private_rules = {
  ingress80 = {
    type        = "ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress443 = {
    type        = "ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress1 = {
    type             = "egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}