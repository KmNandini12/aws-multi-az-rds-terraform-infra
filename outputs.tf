output "ec2_public_ip" {
  description = "The public IP address of the web server"
  value       = aws_instance.web_server.public_ip
}

output "rds_endpoint" {
  description = "The connection endpoint for the RDS database"
  value       = aws_db_instance.mysql_db.endpoint
}

output "vpc_id" {
  description = "The ID of the VPC created"
  value       = aws_vpc.main.id
}