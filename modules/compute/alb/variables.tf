variable "project_name" {
  type          = "string"
  description   = "A logical name that will be used as prefix and tag for the created resources."
}
variable "environment" {
  type        = "string"
  description = "A logical name that will be used as prefix and tag for the created resources."
}
variable "public_subnets" {
  type          = "list"
  description   = "The list of all the subnets where the RDS can be launched."
}
variable "security_groups" {
  type          = "list"
  description   = "This variable receives a list with the security groups that will be attached."
}
variable "vpc_id" {
  type        = "string"
  description = "Define in which VPC the SG will be created."
}
variable "target_group_arn" {
  type        = "string"
  description = "Define the default target group to send traffic to."
}
variable "ssl_certificate_arn" {
  type        = "string"
  description = "If you add this variable another listener will be created using the HTTPS protocol with this certificate."
  default     = ""
}
