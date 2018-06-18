############################
# Credentials
############################
variable "aws_access_key" {
  description = "Credentials provided by Amazon IAM."
  type = "string"
}

variable "aws_secret_key" {
  description = "Credentials provided by Amazon IAM."
  type = "string"
}

variable "aws_region" {
  description = "Select your Amazon Region"
  type = "string"
  default = "us-west-2"
}

############################
# Tags
############################
variable "project_name" {
  type          = "string"
  description   = "A logical name that will be used as prefix and tag for the created resources."
}

variable "environment" {
  description = "A logical name that will be used as prefix and tag for the created resources."
  type        = "string"
}

############################
# VPC Variables
############################
variable "vpc_cidr" {
  description = "The CDIR block used for the VPC."
  default     = "10.0.0.0/16"
  type = "string"
}

variable "availability_zones" {
  type = "map"
  description = "Define which and how many zones will be launched."

  default = {
    us-east-1      = ["us-east-1a", "us-east-1b"]
    us-east-2      = ["us-east-2a", "eu-east-2b"]
    us-west-1      = ["us-west-1a", "us-west-1c"]
    us-west-2      = ["us-west-2a"]
    ca-central-1   = ["ca-central-1a", "ca-central-1b"]
    eu-west-1      = ["eu-west-1a", "eu-west-1b"]
    eu-west-2      = ["eu-west-2a", "eu-west-2b"]
    eu-central-1   = ["eu-central-1a", "eu-central-1b"]
    ap-south-1     = ["ap-south-1a", "ap-south-1b"]
    sa-east-1      = ["sa-east-1a", "sa-east-1c"]
    ap-northeast-1 = ["ap-northeast-1a", "ap-northeast-1c"]
    ap-southeast-1 = ["ap-southeast-1a", "ap-southeast-1b"]
    ap-southeast-2 = ["ap-southeast-2a", "ap-southeast-2b"]
    ap-northeast-1 = ["ap-northeast-1a", "ap-northeast-1c"]
    ap-northeast-2 = ["ap-northeast-2a", "ap-northeast-2c"]
  }
}

############################
# SG Variables
############################
variable "public_ip" {
  type        = "list"
  description = "List of whitelisted IPs"
}

############################
# RDS Variables
############################
variable "engine" {
  type          = "string"
  description   = "Select the database engine [mysql, aurora-mysql]."
  default       = "mysql"
}
variable "storage" {
  default       = 10
  description   = "This variable defines the storage allocated for the RDS instance."
}
variable "instance_tier" {
  default       = "db.t2.micro"
  type          = "string"
  description   = "This variable defines the type of instance that will be launched."
}
variable "db_username" {
  type          = "string"
  description   = "Master username for the RDS instance."
  default       = "root"
}
variable "db_password" {
  type          = "string"
  description   = "Master password for the RDS instance."
}
variable "apply_immediately" {
  default       = false
  description   = "Define the method to be used for the changes [immediately could cause downtime for several minutes]."
}
variable "multi_az" {
  default       = false
  description   = "Multi-AZ option may include extra charges."
}
variable "final_snapshot" {
  default = false
  description = "Option to skip the final_snapshot"
}
variable "retention" {
  default       = 5
  description   = "Define the number of days for Backup retention"
}

############################
# AutoScailing Variables
############################

variable "desired_capacity" {
  type          = "string"
  description   = "The desired default number of instances to run."
}

variable "max_size" {
  type          = "string"
  description   = "The max number of instances the Autoscaling can scale to."
}

variable "min_size" {
  type          = "string"
  description   = "The min number of instances the Autoscaling can de-scale to."
}

variable "instance_type" {
  type          = "string"
  description   = "Define the tier level or class of the EC2 Instances."
}

############################
# ALB Variables
############################

variable "ssl_certificate_arn" {
  type        = "string"
  description = "If you add this variable another listener will be created using the HTTPS protocol with this certificate."
  default     = ""
}
