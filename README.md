Multi-AZ VPC Infrastructure with Managed RDS & Automated AMIA production-ready, two-tier AWS architecture provisioned via Terraform. This project demonstrates the decoupling of application and data layers to ensure high availability and network isolation.
## Architecture Overview
The infrastructure is deployed across multiple Availability Zones (AZs) to eliminate single points of failure.
**VPC**: Custom Virtual Private Cloud with public/private subnet segmentation.
**Compute**: Public EC2 instance (Amazon Linux 2) acting as a web server, accessible via SSH.
**Database**: Amazon RDS (MySQL) hosted in a private subnet, utilizing a Multi-AZ DB Subnet Group.
**Security**: Implements a strict "Security Group Handshake"—the RDS instance only accepts traffic on port 3306 from the Web Server's security group.

## Tech StackIaC Tool: 
Terraform Cloud Provider: AWS Database: Amazon RDS MySQL Security: RSA Key Pairs, Security Groups, VPC Isolation 🚀 Deployment StepsGenerate SSH Keys:Bashssh-keygen -t rsa -f my-key
Initialize Terraform:Bashterraform init
Review Execution Plan:Bashterraform plan
Apply Configuration:Bashterraform apply -auto-approve
📊 Key LearningsDynamic Data Sources: Used aws_availability_zones to ensure the configuration remains region-agnostic.Redundancy Requirements: AWS mandates a minimum of two AZs for RDS Subnet Groups, ensuring architectural resilience even in dev environments.State Management: Recognized the importance of .gitignore for protecting terraform.tfstate and private credentials.
