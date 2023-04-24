# General resources
env        = "dev"
aws_region = "us-east-2"

# AWS resources
vpc = {
  name          = "lab02"
  address_space = "10.0.2.0/24"
}
subnet = {
  private = ["10.0.2.0/27", "10.0.2.32/27", "10.0.2.64/27"]
}
availability_zone = ["us-east-2a", "us-east-2b", "us-east-2c"]
instance = {
  aws1 = {
    ami       = "ami-0cc87e5027adcdca8"
    type      = "t2.nano"
    key_name  = "testKey"
    subnet_id = "0"
  }
  aws2 = {
    ami       = "ami-0cc87e5027adcdca8"
    type      = "t2.nano"
    key_name  = "testKey"
    subnet_id = "1"
  }
  aws3 = {
    ami       = "ami-0cc87e5027adcdca8"
    type      = "t2.nano"
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

