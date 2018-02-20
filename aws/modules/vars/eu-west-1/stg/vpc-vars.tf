output "public_subnets_cidr" {
  value = "${var.public_subnets_cidr}"
}

variable "public_subnets_cidr" {
  type = "map"

  default = {
    "eu-west-1a" = "10.100.1.0/24"
    "eu-west-1b" = "10.101.2.0/24"
    "eu-west-1c" = "10.102.3.0/24"
  }
}

output "public_subnets_id" {
  value = "${var.public_subnets_id}"
}

variable "public_subnets_id" {
  type = "map"

  default = {
    "eu-west-1a" = "subnet-83ef22cb"
    "eu-west-1b" = "subnet-19aa9242"
    "eu-west-1c" = "subnet-404ab526"
  }
}



output "private_subnets_cidr" {
  value = "${var.private_subnets_cidr}"
}

variable "private_subnets_cidr" {
  type = "map"

  default = {
    "eu-west-1a" = "10.0.1.0/24"
    "eu-west-1b" = "10.0.2.0/24"
    "eu-west-1c" = "10.0.3.0/24"
  }
}


output "private_subnets_id" {
  value = "${var.private_subnets_id}"
}

variable "private_subnets_id" {
  type = "map"

  default = {
    "eu-west-1a" = "subnet-ef4ab589"
    "eu-west-1b" = "subnet-d4a1998f"
    "eu-west-1c" = "subnet-56ed201e"
  }
}


output "vpc_id" {
  value = "vpc-366dca50"
}


