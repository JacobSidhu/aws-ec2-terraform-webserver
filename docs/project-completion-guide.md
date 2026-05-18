# Project Completion Guide

Use this guide to finish the repository in professional, reviewable milestones. The goal is to show steady project structure without making artificial time-based commits.

## Before You Start

Check the working tree and confirm local-only Terraform files are ignored:

```bash
git status --short
git check-ignore -v terraform.tfvars terraform.tfstate terraform.tfstate.backup
```

Do not commit AWS credentials, `terraform.tfvars`, Terraform state files, private SSH keys, or local AWS CLI installer artifacts.

## Milestone 1: Repository Hygiene and Terraform Formatting

Clean local installer artifacts if they exist, format Terraform, and commit the hygiene work:

```bash
rm -rf aws awscliv2.zip LICENSE.txt
terraform fmt
git add .gitignore .terraform.lock.hcl variables.tf providers.tf terraform.tfvars.example
git commit -m "chore: clean repository and format Terraform files"
```

## Milestone 2: Terraform Infrastructure

Add the AWS infrastructure, outputs, and EC2 user data script:

```bash
git add main.tf outputs.tf user-data.sh
git commit -m "feat: add AWS EC2 web server infrastructure"
```

## Milestone 3: Codespaces Development Environment

Add the devcontainer so the project can be opened consistently in GitHub Codespaces:

```bash
git add .devcontainer/devcontainer.json
git commit -m "chore: add Codespaces development container"
```

## Milestone 4: Portfolio Documentation

Complete the README as the main public project write-up:

```bash
git add README.md docs/project-completion-guide.md
git commit -m "docs: complete AWS Terraform project documentation"
```

## Milestone 5: Architecture and Screenshots

Add the exported Eraser architecture diagram and real screenshots captured after deployment:

```bash
git add docs/architecture docs/screenshots
git commit -m "docs: add architecture and deployment screenshots"
```

Use these screenshot filenames:

```text
docs/screenshots/terraform-plan.png
docs/screenshots/terraform-apply-success.png
docs/screenshots/aws-vpc-resources.png
docs/screenshots/ec2-instance-overview.png
docs/screenshots/nginx-browser-test.png
```

## Milestone 6: Final Validation and GitHub Polish

Run the final checks, review the working tree, and push:

```bash
terraform fmt -check
terraform validate
git status --short
git push origin main
```

After pushing, update the GitHub repository description and topics:

```text
Description:
Deploys an AWS EC2 Ubuntu web server with Nginx using Terraform, including custom VPC, public subnet, internet gateway, route table, security group, and user data automation.

Topics:
aws, terraform, ec2, vpc, nginx, linux, infrastructure-as-code, cloud-engineering, devops, security-groups
```
