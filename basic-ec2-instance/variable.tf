variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default     = "first_vpc"
  description = "Name the VPC"
}

variable "public_cidr_block" {
  default = "10.0.2.0/16"
}
