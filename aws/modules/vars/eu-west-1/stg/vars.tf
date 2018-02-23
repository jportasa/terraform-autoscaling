output "vpc_id" {
  value = "vpc-366dca50"
}
############################################
output "public_subnets_cidr" {
  value = "${var.public_subnets_cidr}"
}

variable "public_subnets_cidr" {
  type = "map"

  default = {
    "eu-west-1a" = "10.0.101.0/24"
  }
}
############################################
output "public_subnets_id" {
  value = "${var.public_subnets_id}"
}

variable "public_subnets_id" {
  type = "map"

  default = {
    "eu-west-1a" = "subnet-83ef22cb"
  }
}
############################################
output "private_subnets_cidr" {
  value = "${var.private_subnets_cidr}"
}

variable "private_subnets_cidr" {
  type = "map"

  default = {
    "eu-west-1a" = "10.0.1.0/24"
  }
}
############################################
output "private_subnets_id" {
  value = "${var.private_subnets_id}"
}

variable "private_subnets_id" {
  type = "map"

  default = {
    "eu-west-1a" = "subnet-56ed201e"

  }
}
############################################



