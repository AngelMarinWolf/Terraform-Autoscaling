variable "project_name" {
  type          = "string"
  description   = "A logical name that will be used as prefix and tag for the created resources."
}

variable "environment" {
  type        = "string"
  description = "A logical name that will be used as prefix and tag for the created resources."
}

variable "aws_region" {
  type = "string"
  description = "Describe the Amazon region you'll be working in."
  default = "us-west-2"
}

variable "server_ami" {
  type             = "map"
  description      = "It's a map with a list of AMIs used for each region, at least one is required for your region."

  default = {
    us-east-1      = "ami-14c5486b"
    us-east-2      = "ami-976152f2"
    us-west-1      = "ami-46e1f226"
    us-west-2      = "ami-6b8cef13"
  }
}

variable "subnet_ids" {
  type          = "list"
  description   = "The list of all the subnets where the New EC2 Instances can be launched."
}

variable "security_groups" {
  type          = "list"
  description   = "This variable receive a list with the security groups that will be attached."
}

variable "user_data" {
  type          = "string"
  description   = "This variable receives the user-data script that will be executed at launch time."
}

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

variable "availability_zones" {
  type          = "list"
  description   = "Define the availability zone of your preference."
}

variable "public_key" {
  type        = "string"
  description = "Public SSH Key that will be used to access the server."
}

variable "target_group_arn" {
  type        = "string"
  description = "Application Load Balancer - Target Group - ARN"
}
