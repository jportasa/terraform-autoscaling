data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t1.micro"
  security_groups = ["${aws_security_group.webserver_sg.id}"]
  subnet_id         = "subnet-83ef22cb"
  key_name          = "${var.ssh_key_name}"
  associate_public_ip_address = true

  tags {
    Name = "webserver"
  }
}

