# General resources
env        = "api"


# AWS resources
aws_region = "us-east-2"
## Network
vpc = {
  name          = "api-lab01"
  address_space = "10.0.2.0/24"
}
availability_zone = ["us-east-2a", "us-east-2b", "us-east-2c"]
subnet = {
  private = ["10.0.2.0/27", "10.0.2.32/27", "10.0.2.64/27"]
}

## Instance
