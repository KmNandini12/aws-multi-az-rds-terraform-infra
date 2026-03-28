resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"
  # We include both subnets to cover 2 AZs (names[0] and names[1])
  subnet_ids = [aws_subnet.public.id, aws_subnet.private.id]

  tags = {
    Name = "Main-DB-Subnet-Group"
  }
}

resource "aws_db_parameter_group" "mysql_params" {
  name   = "mysql-custom-params"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }
}

# 3. RDS Instance
resource "aws_db_instance" "mysql_db" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "mydb"
  username               = "admin"
  password               = "password123" 
  parameter_group_name   = aws_db_parameter_group.mysql_params.name
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = false # Keeps it in the private subnet
}