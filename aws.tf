module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.env}-${var.vpc.name}"
  cidr = var.vpc.address_space

  azs             =  var.availability_zone 
  #public_subnets  = var.subnet.public
  private_subnets = var.subnet.private

  enable_vpn_gateway     = false
  create_egress_only_igw = false
  create_igw             = false
  tags                   = var.tags
}

resource "aws_security_group" "sg" {
  for_each = var.aws_security_groups

  name        = each.value.name
  description = each.value.description
  vpc_id      = module.vpc.vpc_id
  tags        = var.tags
}

resource "aws_security_group_rule" "private" {
  for_each = var.aws_private_rules

  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.sg["private"].id
  cidr_blocks       = each.value.cidr_blocks
  ipv6_cidr_blocks  = each.value.type == "egress" ? each.value.ipv6_cidr_blocks : null
}

module "aws_instance01" {
  for_each = var.instance
  source   = "terraform-aws-modules/ec2-instance/aws"
  version  = ">= 4.3.0"

  name                   = each.key
  ami                    = each.value.ami
  instance_type          = each.value.type
  monitoring             = true
  subnet_id              = module.vpc.private_subnets[each.value.subnet_id]
  vpc_security_group_ids = [aws_security_group.sg["private"].id]
  tags                   = var.tags
  depends_on             = [
    module.vpc
  ]
}