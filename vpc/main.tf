provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "vpc-test-practice" {
  cidr_block = var.vpc_cidr

tags = {
  Name = "VPC: vpc-test-practice"
}

}
