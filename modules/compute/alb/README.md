# Application Load Balancer - ALB
This module creates an Application Load Balancer and attaches an HTTP listener by default. If you add the `ssl_certificate_arn` variable (not required), it will also create and attach an HTTPS listener.


### Variables

| Variable     | Type         | Required     | Description  |
| ------------ | :----------: | :----------: | ------------ |
| project_name              | String | Yes | A logical name that will be used as prefix and tag for the created resources. |
| environment               | String | Yes | A logical name that will be used as prefix and tag for the created resources. |
| public_subnets            | List   | Yes | The list of all the subnets where the RDS can be launched. |
| security_groups           | List   | Yes | This variable receives a list with the security groups that will be attached. |
| vpc_id                    | String | Yes | Define in which VPC the SG will be created. |
| target_group_frontend_arn | String | Yes | Define the default target group to send traffic to. |
| ssl_certificate_arn       | String | No  | If you add this variable another listener will be created using the HTTPS protocol with this certificate. |


### Output
| Output       | Type         |  Description  |
| ------------ | :----------: |  ------------ |
| alb_id                | String | Returns the ID of the Application Load Balancer. |
| alb_arn               | String | Returns the ARN of the Application Load Balancer. |
| alb_listener_id       | String | Returns the ID of the HTTP listener attached to the ALB. |
| alb_listener_arn      | String | Returns the ARN of the HTTP listener attached to the ALB. |
| alb_listener_ssl_id   | String | Returns the ID of the HTTPS listener attached to the ALB. (optional) |
| alb_listener_ssl_arn  | String | Returns the ARN of the HTTPS listener attached to the ALB. (optional) |
| dns_name              | String | Returns the DNS of the Application Load Balancer. |
