resource "aws_vpc" "first-vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = var.public_cidr_block
}
