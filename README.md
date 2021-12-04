# Create a sample VPC using Terraform

## Objective

Build a tf file to create VPC usig Terraform tool 

## Prerequisites

- [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)

- [AWS IAM user with access to VPC](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_change-permissions.html#users_change_permissions-add-console)

## Terraform Installation

- To install terraform, run the below commands : 

``` $ wget https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip```

```$ unzip terraform_1.0.11_linux_amd64.zip```

```$ mv terraform /usr/bin/```

## Check the terraform version

```$ terraform version```

## Usage

- Create a directory mycloud ad navigate into it

```$ mkdir mycloud```

- Mention the IAM authentication and region in the provider file

- Set the envirnonment variables (region, vpc_cidr,subnets) in the variables file 

- Execute the below commands : 

```$ terraform init```

```$ terraform validate```

```$ terraform plan```

```$ terraform apply```

## Result

A VPC is created with Internet Gateway, 6 Subnets including 3 public & 3 private, Elastic IP, NAT gateway, Public and Private Route tables and the Route table Association.


