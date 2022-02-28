resource "aws_instance" "demo-instance" {
  ami = "ami-0ed9277fb7eb570c9"
  instance_type = "${var.inst_type}"
  security_groups = "${var.secgrp_ids}"
  availability_zone = "us-east-1a"
  subnet_id = "${var.sn_id}"

  tags = {
    Name = "${var.instance_name}"
  }
}
