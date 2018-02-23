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


# Script to launch in EC2 instance boot
data "template_file" "user_data" {
  template = "${file("${path.module}/user-data.sh")}"

  vars = {
    hostname = "elmeuhostname"
  }
}


resource "aws_instance" "web" {
  ami           = "ami-1b791862"
  instance_type = "t1.micro"
  security_groups = ["${aws_security_group.webserver_sg.id}"]
  subnet_id         = "${var.public_subnets_id.["eu-west-1a"]}"
  key_name          = "${var.ssh_key_name}"
  associate_public_ip_address = true
  user_data                   = "${data.template_file.user_data.rendered}"
  iam_instance_profile = "EC2CodeDeployExample"

  tags {
    Name = "webserver"
  }
}

