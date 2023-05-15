#variable "tags" {}
variable "env" {}

# AWS Resources
variable "aws_region" {}
variable "vpc" {}
variable "availability_zone" {
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}
variable "subnet" {}