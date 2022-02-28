resource "aws_vpc" "demo_vpc" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "demo_subnet" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "10.0.0.128/25"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.subnet_name}"
  }
}

output "subnet_id"{
	description="id of the created subnet"
	value = aws_subnet.demo_subnet.id
}

output "vpc_id"{
	description="id of the created vpc"
	value = aws_vpc.demo_vpc.id
}