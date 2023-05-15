module "network" {
  source            = "app.terraform.io/jeff-spradlin-org/network/aws"
  env               = var.env
  vpc_name          = var.vpc.name
  vpc_address_space = var.vpc.address_space
  availability_zone = var.availability_zone
  private_subnets   = var.subnet.private
  tags = {
    environment = "API"
    department  = "Infrastructure"
    costCenter  = "IT"
    kickoff     = "true"
    billable    = "true"
  }
}

module "instance" {
  source  = "app.terraform.io/jeff-spradlin-org/ec2-instance/aws"
  version = "1.1.3"

  instance_count         = 3
  instance_name          = "lab-test-api"
  subnet_id              = module.network.private_subnet_ids
  vpc_security_group_ids = [module.network.aws_security_group_id]

  tags = {
    environment = "API"
    department  = "Infrastructure"
    costCenter  = "IT"
    billable    = "true"
  }
  depends_on = [
    module.network
  ]

  instance_type = "t2.nano"
  #instance_type = "t2.large"
}