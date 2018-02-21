variable "env" {
  description = "blabla"
}

variable "role" {
  description = "blabla"
}

variable "vpc_id" {
  description = "VPC id to deploy resource"
}


variable "ssh_key_name" {
  description = "Key pair name"
  default     = "joan-aws"
}


variable "public_subnets_id" {
  description = "Private subnets ID in the VPC"
  type        = "map"
}