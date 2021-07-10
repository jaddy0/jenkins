resource "aws_vpc" "bro_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy
  tags = {
    Name = "${terraform.workspace}-bro-vpc"
  }
}
