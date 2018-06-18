############################
# Configure the AWS Provider
############################
provider "aws" {
  access_key    = "${var.aws_access_key}"
  secret_key    = "${var.aws_secret_key}"
  region        = "${var.aws_region}"
}

############################
# Init VPC Module
############################
module "vpc" {
  source              = "../../modules/networking/vpc"

  aws_region          = "${var.aws_region}"
  vpc_cidr            = "${var.vpc_cidr}"
  project_name        = "${var.project_name}"
  environment         = "${var.environment}"
  availability_zones  = "${var.availability_zones}"
}

############################
# Init Security Groups Module
############################

module "security_groups" {
  source              = "../../modules/networking/security_group"

  vpc_id              = "${module.vpc.vpc_id}"
  environment         = "${var.environment}"
  project_name        = "${var.project_name}"
  public_ip           = ["${var.public_ip}"]
}

############################
# Init ALB Module
############################
module "alb" {
  source                   = "../../modules/compute/alb"

  vpc_id                   = "${module.vpc.vpc_id}"
  public_subnets           = "${module.vpc.public_subnets}"
  security_groups          = ["${module.security_groups.sg_alb_id}"]

  ssl_certificate_arn      = "${var.ssl_certificate_arn}"
  target_group_arn         = "${module.tg_develop.alb_tg_arn}"

  environment              = "${var.environment}"
  project_name             = "${var.project_name}"

}

############################
# Init Target Groups Modules
############################
module "tg_develop" {
  source                   = "../../modules/compute/tg"

  vpc_id                   = "${module.vpc.vpc_id}"

  environment              = "${var.environment}-1"
  project_name             = "${var.project_name}"
}

############################
# Init AutoScaling Module
############################
module "autoscaling" {
  source                   = "../../modules/compute/autoscaling"

  environment              = "${var.environment}"
  project_name             = "${var.project_name}"
  aws_region               = "${var.aws_region}"

  subnet_ids               = ["${module.vpc.public_subnets}"]
  security_groups          = ["${module.security_groups.sg_web_id}"]
  availability_zones       = ["${module.vpc.availability_zones}"]
  target_group_arn         = "${module.tg_develop.alb_tg_arn}"

  desired_capacity         = "${var.desired_capacity}"
  max_size                 = "${var.max_size}"
  min_size                 = "${var.min_size}"
  instance_type            = "${var.instance_type}"

  public_key               = "${file("./templates/keys/web-server.pub")}"
  user_data                = "${file("./templates/user-data.sh")}"

}

############################
# Init EC2 Module
############################
module "ec2" {
  source = "../../modules/compute/ec2"

  project_name           = "${var.project_name}"
  environment            = "${var.environment}"
  aws_region               = "${var.aws_region}"

  subnet_id                = "${element(module.vpc.public_subnets, 0)}"
  security_groups          = ["${module.security_groups.sg_app_id}"]
  instance_type            = "${var.instance_type}"

  public_key               = "${file("./templates/keys/app-server.pub")}"
  user_data                = "${file("./templates/app-user-data.sh")}"

}

############################
# Init RDS Module
############################
module "rds" {
  source                 = "../../modules/compute/rds"

  project_name           = "${var.project_name}"
  environment            = "${var.environment}"

  engine                 = "${var.engine}"
  storage                = "${var.storage}"
  instance_tier          = "${var.instance_tier}"

  db_username            = "${var.db_username}"
  db_password            = "${var.db_password}"

  subnet_ids             = "${module.vpc.private_subnets}"
  availability_zone      = "${element(module.vpc.availability_zones, 0)}"
  vpc_security_group_ids = ["${module.security_groups.sg_rds_id}"]

  apply_immediately      = "${var.apply_immediately}"
  multi_az               = "${var.multi_az}"
  retention              = "${var.retention}"
  final_snapshot         = "${var.final_snapshot}"
}
