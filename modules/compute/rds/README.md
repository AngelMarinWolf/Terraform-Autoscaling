# Regional Database - RDS
This module will create an RDS as well as custom parameter groups and subnet groups for each environment.

### Variables

| Variable     | Type         | Required     | Description  |
| ------------ | :----------: | :----------: | ------------ |
| project_name            | String  | Yes | A logical name that will be used as prefix and tag for the created resources. |
| environment             | String  | Yes | A logical name that will be used as prefix and tag for the created resources. |
| subnet_ids              | List    | Yes | The list of all the subnets where the RDS can be launched. |
| engine                  | String  | No  | Select the database engine [mysql, aurora-mysql]. |
| engine_family           | Map     | No  | If you want to use a custom family for the Database Engines, set a map for the options. |
| storage                 | String  | No  | This variable defines the storage allocated for the RDS instance. |
| instance_tier           | String  | No  | This variable defines the type of instance that will be launched. |
| db_username             | String  | No  | Master username for the RDS instance. |
| db_password             | String  | Yes | Master password for the RDS instance. |
| vpc_security_group_ids  | List    | Yes | This variable receives a list with the security groups that will be attached. |
| apply_immediately       | Boolean | No  | Define the method to be used for the changes [immediately could cause downtime for several minutes]. |
| multi_az                | Boolean | No  | Multi-AZ option may include extra charges. |
| availability_zone       | String  | Yes | Define the availability zone of your preference. |
| final_snapshot          | Boolean | No  | Option to skip the final_snapshot. |
| retention               | String  | No  | Define the number of days for Backup retention. |




### Output

| Output       | Type         |  Description  |
| ------------ | :----------: |  ------------ |
| subnet_group_id      | String | Get the ID of the Subnet Group. |
| parameter_group_id   | String | Get the ID of the Parameter Group. |
| subnet_group_arn     | String | Get the ARN of the Subnet Group. |
| parameter_group_arn  | String | Get the ARN of the Parameter Group. |
| instance_id          | String | Get the ID of the RDS instance. |
| endpoint             | String | Get the Endpoint of the RDS instance. |
| status               | String | Get the Status of the RDS instance. |
