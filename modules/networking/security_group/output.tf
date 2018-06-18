output "sg_alb_id" {
  description = "Returns the ID of the ELB's Security Group."
  value       = "${aws_security_group.load_balancer.id}"
}

output "sg_web_id" {
  description = "Returns the ID of the WebServer's Security Group."
  value       = "${aws_security_group.webserver.id}"
}

output "sg_app_id" {
  description = "Returns the ID of the AppServer's Security Group."
  value       = "${aws_security_group.appserver.id}"
}

output "sg_rds_id" {
  description = "Returns the ID of the RDS's Security Group."
  value       = "${aws_security_group.databases.id}"
}
