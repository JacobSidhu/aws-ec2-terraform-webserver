# AWS EC2 Web Server Deployment using Terraform

This project deploys an Ubuntu EC2 web server on AWS using Terraform. It provisions the networking, security, compute, SSH key pair, and automated Nginx setup needed to host a simple public web page.

The purpose of this project is to practise Infrastructure as Code by building a small but complete cloud deployment without manually creating resources through the AWS Console.

## Project Overview

This repository demonstrates how to provision AWS infrastructure with Terraform and automatically configure an EC2 instance using user data.

The project focuses on:

- Infrastructure as Code with Terraform
- AWS VPC and subnet fundamentals
- Internet Gateway and public route table configuration
- EC2 instance provisioning
- Security Group inbound and outbound rules
- SSH access restricted to a single public IP CIDR
- Automated Nginx installation using EC2 user data
- Professional documentation, screenshots, and repeatable setup

## Architecture

![AWS EC2 Terraform Architecture](docs/architecture/aws-ec2-terraform-webserver-architecture.png)

[View editable architecture diagram in Eraser](https://app.eraser.io/workspace/10SDNiSyS0AF5Qn40GuA?origin=share)

## Architecture Flow

User traffic flows through the following path:

```text
User Browser
    -> Internet
    -> AWS Internet Gateway
    -> Public Route Table
    -> Public Subnet
    -> Security Group
    -> EC2 Ubuntu Instance
    -> Nginx Web Server
```

## What This Project Deploys

Terraform provisions:

- AWS VPC
- Public subnet
- Internet Gateway
- Public route table
- Route table association
- Security Group
- SSH key pair
- Ubuntu EC2 instance
- Nginx web server installed through EC2 user data

## Technology Stack

- AWS
- Terraform
- EC2
- VPC
- Security Groups
- Ubuntu Linux
- Nginx
- Bash
- GitHub
- GitHub Codespaces

## Repository Structure

```text
aws-ec2-terraform-webserver/
|-- .devcontainer/
|   `-- devcontainer.json
|-- docs/
|   |-- architecture/
|   |   `-- aws-ec2-terraform-webserver-architecture.png
|   |-- screenshots/
|   |   `-- README.md
|   `-- project-completion-guide.md
|-- .gitignore
|-- .terraform.lock.hcl
|-- README.md
|-- main.tf
|-- outputs.tf
|-- providers.tf
|-- terraform.tfvars.example
|-- user-data.sh
`-- variables.tf
```

## Design Decisions

- Terraform is used so the infrastructure is repeatable, reviewable, and version-controlled.
- A custom VPC is created instead of relying on the default VPC.
- A public subnet is used because the web server must be reachable from the internet.
- An Internet Gateway and public route table provide public connectivity.
- A Security Group allows HTTP from the internet and restricts SSH to a specific CIDR block.
- EC2 user data installs and starts Nginx automatically when the instance launches.
- Terraform outputs make it easy to find the EC2 public IP, DNS name, web URL, and SSH command.
- GitHub Codespaces is included so the development environment can be recreated consistently.

## Security Notes

- Do not commit AWS access keys, secret keys, private SSH keys, `terraform.tfvars`, or Terraform state files.
- Restrict SSH access to your own public IP address using a `/32` CIDR block.
- Do not expose SSH to `0.0.0.0/0`.
- Use short-lived or carefully managed AWS credentials when working from Codespaces.
- Destroy resources after testing to avoid unnecessary AWS charges.
- This project is a learning and portfolio deployment, not a production architecture.

## Prerequisites

Before running this project, you need:

- Terraform
- AWS CLI
- Git
- An AWS account
- An SSH key pair

If you use GitHub Codespaces, the included devcontainer installs Terraform, AWS CLI, and supporting tools automatically.

## AWS Credentials

Terraform uses the standard AWS provider credential chain. For local development or Codespaces, configure credentials with:

```bash
aws configure
```

Recommended values for this project:

```text
Default region name: eu-west-2
Default output format: json
```

Confirm your credentials work:

```bash
aws sts get-caller-identity
```

Do not store AWS credentials in Terraform files, the README, `terraform.tfvars`, or GitHub commits. For Codespaces, prefer repository or user-level Codespaces secrets when available.

## Deployment Steps

Clone the repository:

```bash
git clone https://github.com/JacobSidhu/aws-ec2-terraform-webserver.git
cd aws-ec2-terraform-webserver
```

Create your local variables file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` and replace:

```text
YOUR_PUBLIC_IP/32
```

with your real public IP address in CIDR format.

Initialize Terraform:

```bash
terraform init
```

Format the Terraform files:

```bash
terraform fmt
```

Validate the configuration:

```bash
terraform validate
```

Preview the infrastructure:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

Confirm by typing:

```text
yes
```

## Testing

After deployment, Terraform outputs the public IP address and web URL.

Open the web server in a browser:

```text
http://PUBLIC_IP_ADDRESS
```

Or test it with curl:

```bash
curl http://PUBLIC_IP_ADDRESS
```

Expected page content includes:

```text
Hello from AWS EC2
This web server was deployed using Terraform Infrastructure as Code.
Running on Ubuntu with Nginx.
```

You can also SSH into the instance from the allowed IP address:

```bash
ssh ubuntu@PUBLIC_IP_ADDRESS
```

## Screenshots

Capture real screenshots after deployment and save them in `docs/screenshots/`.

| Screenshot | File |
| --- | --- |
| Terraform plan output | `docs/screenshots/terraform-plan.png` |
| Terraform apply success | `docs/screenshots/terraform-apply-success.png` |
| AWS VPC resources | `docs/screenshots/aws-vpc-resources.png` |
| EC2 instance overview | `docs/screenshots/ec2-instance-overview.png` |
| Nginx browser test | `docs/screenshots/nginx-browser-test.png` |

## Cleanup

To avoid unnecessary AWS charges, destroy the infrastructure after testing:

```bash
terraform destroy
```

Confirm by typing:

```text
yes
```

## Cost Management

This project can create billable AWS resources.

To reduce cost:

- Use a small EC2 instance type for testing.
- Destroy the infrastructure after completing the lab.
- Avoid leaving the EC2 instance running overnight.
- Review AWS billing regularly.

## Future Improvements

Possible next improvements:

- Add HTTPS using a domain and TLS certificate.
- Use Route 53 for DNS.
- Add an Application Load Balancer.
- Store Terraform state remotely in S3 with DynamoDB locking.
- Add GitHub Actions for Terraform validation.
- Add CloudWatch logs and monitoring.
- Add an IAM role for the EC2 instance.
- Convert the VM-based deployment into a Docker-based deployment.
- Deploy the containerized app using ECS.

## What I Learned

Through this project, I practised:

- AWS VPC basics
- Public subnet configuration
- Internet Gateway setup
- Route table configuration
- Security Group inbound rules
- EC2 instance provisioning
- SSH key pair usage
- Nginx automation with EC2 user data
- Terraform resource provisioning
- Testing web server access through a public IP
- Documenting architecture and engineering decisions

## Project Summary

This project demonstrates a small but complete cloud engineering workflow:

```text
Write Terraform code
    -> Provision AWS infrastructure
    -> Configure EC2 automatically
    -> Deploy Nginx web server
    -> Test public access
    -> Document architecture and decisions
    -> Destroy resources safely
```

The goal is not only to create an EC2 instance. The goal is to show how networking, routing, security, compute, automation, documentation, and cleanup fit together in a practical AWS deployment.
