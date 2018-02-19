variable "private_subnets_cidr" {
  type = "map"

  default = {
    "eu-west-1a" = "10.221.196.0/22"
    "eu-west-1b" = "10.221.204.0/22"
    "eu-west-1c" = "10.221.212.0/22"
  }
}