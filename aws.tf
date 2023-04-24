module "network" {
  source = "app.terraform.io/jeff-spradlin-org/network/aws"
  env = var.env
  vpc_name          = var.vpc.name
  vpc_address_space = var.vpc.address_space
  availability_zone = var.availability_zone
  private_subnets   = var.subnet.private
  tags = {
    environment = "Dev"
    department  = "Infrastructure"
    costCenter  = "IT"
    kickoff     = "true"
  }
}

module "aws_instance01" {
  for_each = var.instance
  source  = "app.terraform.io/jeff-spradlin-org/ec2-instance/aws"

  name                   = each.key
  ami                    = each.value.ami
  instance_type          = each.value.type
  monitoring             = true
  subnet_id              = element(module.network.private_subnet_ids, each.value.subnet_id)
  vpc_security_group_ids = [module.network.aws_security_group_id]
  tags = {
    environment = "Dev"
    department  = "Infrastructure"
    costCenter  = "IT"
    kickoff     = "true"
  }
  depends_on = [
    module.network
  ]
}