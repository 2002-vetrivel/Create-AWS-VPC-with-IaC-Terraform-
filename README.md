# AWS VPC creation using Infrastructure as Code (IaC) with Terraform. 

## Features

* Creates a VPC with a customizable CIDR block
* Adds public and private subnets
* Configures Internet Gateway and Route Tables
* Supports input variables for flexibility
* Modular and reusable code

## Prerequisites

* [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
* An AWS account
* AWS credentials configured via `~/.aws/credentials` or environment variables

## Usage

1. **Clone the repository**

   ```bash
   git clone https://github.com/2002-vetrivel/Create-AWS-VPC-with-IaC-Terraform-.git
   cd aws-vpc-terraform
   ```

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Review the execution plan**

   ```bash
   terraform plan
   ```

4. **Apply the configuration**

   ```bash
   terraform apply
   ```

5. **Destroy the infrastructure (optional)**

   ```bash
   terraform destroy
   ```
