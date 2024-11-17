
data "aws_ami" "latest_amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Pattern for Amazon Linux 2 AMI
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"] # Optional: only EBS-backed AMIs
  }

}

resource "aws_instance" "server" {
  ami                         = data.aws_ami.latest_amazon_linux_2.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  associate_public_ip_address = true

  tags = {
    name = "${var.environment}-server"
  }

  depends_on = [aws_security_group.security_group,
  aws_internet_gateway.internet_gateway]
}

resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/ec2-keys/server-key.pub")
}
