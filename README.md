# Terraform AWS - ECS with Auto Scaling Group
![](https://img.shields.io/badge/Terraform-0.10.3-brightgreen.svg) ![](https://img.shields.io/badge/Version-1.0.0-blue.svg)

This Terraform project was developed to create an AutoScaling Group with High Availability.

#### Diagram
![Terraform Environment](img/aws-diagram.png)

## Environments
In this directory you'll find the environment profiles where you can specify how they must be configured. It is highly recommended to have a `templates` folder where you can save keys, scripts or other files that you could need.

Also, you have to create a `terraform.tfvars` file that contains all the values to be used in the environment. These values are highly sensitive and they should never be committed to the repository, so it must be added to the `.gitignore` file.

The `main.tf` file is the profile that indicates what, how and how many resources will be created. Inside of the `variables.tf` file you can see the variables that you'll need. The variables that already have default values can be optional, all other variables that don't include default values are required.

## Modules
Based on the official Amazon repositories, these modules were reworked in order to make them more flexible and easy to understand. Each important section or element in the infrastructure has one module specific to it and can be re-utilized multiple times.

## Execution
In order to run the Terraform script you have to move into the environment directory and then type the following commands into the Terminal:

The `init` command loads the modules' source from the directory or the repositories.
> NOTE: This command can also be used to check the syntax.

```bash
terraform init
```
With the `plan` command you can check what changes will be applied before actually applying them.
```bash
terraform plan
```
Finally, you have to run the `apply` command to execute the changes on the AWS environment, before applying the changes it will prompt for approval and show you a similar output than the `plan` command.
```bash
terraform apply
```
#### Terraform Backend
In order to collaborate with other people, you have to define a backend file inside of the environment directory. Create a `backend.tf` file with the following content:

```terraform
terraform {
  required_version = ">= 0.10.3"

  backend "s3" {
    encrypt = true
    bucket = "terraform-equinox"
    dynamodb_table = "terraform-state-lock-dynamo"
    key = "PROJECT/terraform-develop.tfstate"
    region = "us-west-2"
  }
}
```
This file will allow working in a team trough the creation of a shared `.tfstate` file that saves the current state of the infrastructure and the `DynamoDB Table` that avoids team members from executing changes in the infrastructure at the same time, corrupting the environment.

## Requirements

   - AWS SSL Certificate (optional)
   - AWS Access Key
   - AWS Secret Key

## Resources
   - Application Load Balancer (ALB)
   - Target Groups (TG)
   - Security Groups (SG)
   - Elastic Compute Cloud (EC2)
   - Auto Scaling Groups (ASG)
   - Launch Configuration (LC)
   - Regional Database (RDS)
   - Virtual Private Cloud (VPC)
   - Subnets
   - Internet Gateway
   - NAT Gateway
   - Routing Tables
