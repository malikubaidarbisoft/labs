
resource "aws_security_group" "TF-SG" {

  description = "Allow SSH 22, HTTP 80 & HTTPS 443"
  
 dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  # ingress {
  #   description      = "Allow 443 from anywhere"
  #   from_port        = 443
  #   to_port          = 443
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }

  # ingress {
  #   description      = "Allow 80 from anywhere"
  #   from_port        = 80
  #   to_port          = 80
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }

  # ingress {
  #   description      = "Allow SSH on 22 from anywhere"
  #   from_port        = 22
  #   to_port          = 22
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }   

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TF-SG"
  }
}
