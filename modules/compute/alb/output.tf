output "alb_id" {
  description = "Returns the ID of the Application Load Balancer."
  value       = "${aws_lb.application_load_balancer.id}"
}
output "alb_arn" {
  description = "Returns the ARN of the Application Load Balancer."
  value       = "${aws_lb.application_load_balancer.arn}"
}
output "alb_listener_id" {
  description = "Returns the ID of the HTTP listener attached in the ALB."
  value       = "${aws_lb_listener.default.id}"
}
output "alb_listener_arn" {
  description = "Returns the ARN of the HTTP listener attached in the ALB."
  value       = "${aws_lb_listener.default.arn}"
}
output "alb_listener_ssl_id" {
  description = "Returns the ID of the HTTPS listener attached in the ALB. (optional)"
  value       = "${aws_lb_listener.ssl.*.id}"
}
output "alb_listener_ssl_arn" {
  description = "Returns the ARN of the HTTPS listener attached in the ALB. (optional)"
  value       = "${aws_lb_listener.ssl.*.arn}"
}
output "dns_name" {
  description = "Returns the DNS of the Application Load Balancer."
  value       = "${aws_lb.application_load_balancer.dns_name}"
}
