variable "tags" {}
variable "env" {}

# AWS Resources
variable "aws_region" {
    default = "us-east-2"
}
variable "vpc" {}
variable "availability_zone" {
    default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}
variable "subnet" {
    default = {
        public = ["10.0.0.0/27", "10.0.0.32/27", "10.0.0.64/27"]
        private = ["10.0.1.0/27", "10.0.1.32/27", "10.0.1.64/27"]
    }
}
variable "instance" {}
variable "aws_load_balancer" {}
variable "aws_security_groups" {}
variable "aws_public_rules" {}
variable "aws_private_rules" {}