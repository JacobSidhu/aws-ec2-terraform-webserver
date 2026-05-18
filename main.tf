locals {
  common_tags = {
    project     = "azure-vm-terraform-webserver"
    environment = "demo"
    managed_by  = "terraform"
  }
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "${var.project_name}-vpc"
    ManagedBy = "terraform"
  }
}