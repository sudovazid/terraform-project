output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "security_group_id" {
  value = aws_security_group.security_group.id
}

output "instance_public_ip" {
  value = aws_instance.server.public_ip
}
