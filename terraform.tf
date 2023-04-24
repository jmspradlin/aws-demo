terraform {
  cloud {
    organization = "jeff-spradlin-org"

    workspaces {
      name = "aws-demo-adopt"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "4.54.0"
    }
  }

  required_version = ">= 1.1.0"
}