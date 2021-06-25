
resource "aws_instance" "instance" {
  instance_type = "t2.micro"
  ami           = var.ami
  security_groups = [aws_security_group.TF-SG.name]
  key_name = "ubaid"
  
    # root disk
  root_block_device {
    volume_size           = "30"
    volume_type           = "gp2"
    encrypted             = false
    delete_on_termination = true
  }

  tags = {
    type = "terraform-test-instance"
    Name = var.instance_name
  }
}

