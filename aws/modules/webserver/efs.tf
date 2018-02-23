# Elastic File System for Reno
resource "aws_efs_file_system" "web_efs" {
  tags {
    Environment = "${lower(var.env)}"
    Name        = "web-efs"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_efs_mount_target" "web_mount" {
  file_system_id  = "${aws_efs_file_system.web_efs.id}"
  subnet_id       = "${var.public_subnets_id.["eu-west-1a"]}"
  security_groups = ["${aws_security_group.webserver_sg.id}"]

  lifecycle {
    prevent_destroy = true
  }
}