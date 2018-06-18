# Target Groups
The Target Group Module creates targets and configures the health checks.

### Variables

| Variable     | Type         | Required     | Description  |
| ------------ | :----------: | :----------: | ------------ |
| project_name       | String | Yes | A logical name that will be used as prefix and tag for the created resources. |
| environment        | String | Yes | A logical name that will be used as prefix and tag for the created resources. |
| vpc_id             | String | Yes | Define in which VPC the TG will be created. |

### Output

| Output       | Type         |  Description  |
| ------------ | :----------: |  ------------ |
| alb_tg_id   | String | Application Load Balancer - Target Group - ID |
| alb_tg_arn  | String | Application Load Balancer - Target Group - ARN |
