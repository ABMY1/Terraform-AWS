
provider "aws" {
  region  = "ap-south-1"
}



# module "vpc" {
#   source = "./vpc"
#   # Add other necessary variables for the VPC module
# }

# module "vpc" {
#   source = "./vpc"
#   vpc_id = module.vpc.vpc_id
#   # Add other necessary variables for the security module
# }

# module "lambda" {
#   source = "./lambda"
#   vpc_id = module.vpc.vpc_id
#   # Add other necessary variables for the lambda module
# }

# module "api_gateway" {
#   source = "./api-gateway"
#   # Add other necessary variables for the API Gateway module
# }

# module "database" {
#   source               = "./database"
#   private_subnet_ids   = module.vpc.private_subnet_ids
#   db_username          = var.db_username
#   db_password          = var.db_password
#   db_name              = var.db_name
#   db_instance_class    = var.db_instance_class
#   rds_security_group_id = module.security.rds_security_group_id
# }

# resource "aws_security_group" "rds_sg" {
#   name        = "rds_security_group"
#   description = "Allow MySQL traffic"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["172.16.0.0/22"] 
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "rds_security_group"
#   }
# }

# output "rds_security_group_id" {
#   value = aws_security_group.rds_sg.id
# }

# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.16"
#     }
#   }

#   required_version = ">= 1.2.0"
# }

# provider "aws" {
#   region  = "ap-south-1"
# }

# resource "aws_instance" "app_server" {
#   ami           = "ami-830c94e3"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "ExampleAppServerInstance"
#   }
# }
