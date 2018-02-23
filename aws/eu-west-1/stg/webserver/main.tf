
provider "aws" {
  region = "eu-west-1"
  shared_credentials_file = "/Users/jporta/.aws/credentials"
}

module "vars-stg" {
  source = "../../../modules/vars/eu-west-1/stg"
}


module "nginx" {
  env = "stg"
  role = "webserver"
  public_subnets_id = "${module.vars-stg.public_subnets_id}"
  public_subnets_cidr = "${module.vars-stg.public_subnets_cidr}"

  # Loaded variables from prod module
  vpc_id               = "${module.vars-stg.vpc_id}"
  source             = "../../../modules/webserver"

}

