############################
# SSH Key
############################
resource "aws_key_pair" "public_key" {
  key_name   = "web-${var.project_name}-${var.environment}"
  public_key = "${var.public_key}"
}

############################
# Launch Configuration
############################
resource "aws_launch_configuration" "launchconfiguration" {
  name                    = "lc-web-${var.project_name}-${var.environment}"

  key_name                = "${aws_key_pair.public_key.key_name}"
  image_id                = "${var.server_ami[var.aws_region]}"
  instance_type           = "${var.instance_type}"
  associate_public_ip_address = true

  security_groups         = ["${var.security_groups}"]
  user_data               = "${var.user_data}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }

}

############################
# AutoScailing Group
############################
resource "aws_autoscaling_group" "autoscaling" {
  availability_zones        = ["${var.availability_zones}"]
  name                      = "autoscaling-${var.project_name}-${var.environment}"

  desired_capacity          = "${var.desired_capacity}"
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"

  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.launchconfiguration.name}"

  vpc_zone_identifier       = ["${var.subnet_ids}"]
  enabled_metrics           = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]

  tags = [
    {
      key                     = "Name"
      value                   = "WebServer-${var.project_name}-${var.environment}"
      propagate_at_launch     = true
    },
    {
      key                     = "Environment"
      value                   = "${var.environment}"
      propagate_at_launch     = true
    },
    {
      key                     = "Project"
      value                   = "${var.project_name}"
      propagate_at_launch     = true
    }
  ]
}

############################
# Target Group attachment
############################
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = "${aws_autoscaling_group.autoscaling.id}"
  alb_target_group_arn   = "${var.target_group_arn}"
}
