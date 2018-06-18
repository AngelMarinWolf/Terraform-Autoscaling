# EC2 Instances
The Autoscaling Module will register a Launch Configuration and the SSH Key after creating the Auto Scaling Group.

### Variables

| Variable     | Type         | Required     | Description  |
| ------------ | :----------: | :----------: | ------------ |
| project_name       | String | Yes | A logical name that will be used as prefix and tag for the created resources. |
| environment        | String | Yes | A logical name that will be used as prefix and tag for the created resources. |
| aws_region         | String | No  | Describe the Amazon region you'll be working in. |
| server_ami         | Map    | No  | It's a map with a list of AMIs used for each region, at least one is required for your region. |
| subnet_ids         | List   | Yes | The list of all the subnets where the New EC2 Instances can be launched. |
| security_groups    | List   | Yes | This variable receives a list with the security groups that will be attached. |
| user_data          | String | Yes | This variable receives the user-data script that will be executed at launch time. |
| instance_type      | String | Yes | Define the tier level or class of the EC2 Instances. |
| public_key         | String | Yes | Public SSH Key that will be used to access the server. |
