

resource "aws_instance" "myapp-server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = "jenkins-server"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("script1.sh")
  tags = {
    Name = "${var.env_prefix}-server"
  }
}