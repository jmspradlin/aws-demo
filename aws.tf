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

# module "aws_instance01" {
#   for_each = var.instance
#   source   = "terraform-aws-modules/ec2-instance/aws"
#   version  = ">= 4.3.0"

#   name                   = each.key
#   ami                    = each.value.ami
#   instance_type          = each.value.type
#   monitoring             = true
#   subnet_id              = toset(module.network.private_subnet_ids)
#   vpc_security_group_ids = module.network.aws_security_group_id
#   tags                   = var.tags
#   depends_on = [
#     module.network
#   ]
# }

output "subnets" {
  value =  module.network.private_subnet_ids
}