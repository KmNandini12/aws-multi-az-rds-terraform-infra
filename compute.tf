data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  # REMOVED the ${} - just use a plain string for the path
  public_key = file("${path.module}/my-key.pub")
}

resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  key_name               = aws_key_pair.deployer.key_name

  tags = {
    Name = "Public-EC2-Instance"
  }
}