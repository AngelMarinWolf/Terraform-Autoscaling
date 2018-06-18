############################
# SSH Key
############################
resource "aws_key_pair" "public_key" {
  key_name   = "app-${var.project_name}-${var.environment}"
  public_key = "${var.public_key}"
}

#######################
# AppServer Instance
#######################
resource "aws_instance" "appserver" {
  key_name                = "${aws_key_pair.public_key.key_name}"
  ami                     = "${var.server_ami[var.aws_region]}"
  instance_type           = "${var.instance_type}"
  associate_public_ip_address = true

  subnet_id               = "${var.subnet_id}"
  vpc_security_group_ids  = ["${var.security_groups}"]
  user_data               = "${var.user_data}"
  monitoring              = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }

  tags {
    Name = "AppServer-${var.project_name}-${var.environment}"
  }
}
