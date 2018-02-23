resource "aws_security_group" "webserver_sg" {
  name        = "${var.env}-${var.role}-sg"
  vpc_id      = "${var.vpc_id}"

  # Allow access from trusted IPs
  ingress {
    from_port       = 80
    to_port         = 81
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["${var.public_subnets_cidr.["eu-west-1a"]}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.env}-${var.role}-sg"
    Team        = "devops"
    Terraform   = "true"
  }
}
