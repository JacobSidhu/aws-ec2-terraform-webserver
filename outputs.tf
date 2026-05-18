output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the created VPC"
  value       = aws_vpc.main.cidr_block
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.web.public_dns
}

output "web_url" {
  description = "HTTP URL for the Nginx web server"
  value       = "http://${aws_instance.web.public_ip}"
}

output "ssh_command" {
  description = "SSH command to connect to the EC2 instance"
  value       = "ssh ubuntu@${aws_instance.web.public_ip}"
}