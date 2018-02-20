
provider "aws" {
  region = "eu-west-1"
  shared_credentials_file = "/Users/jporta/.aws/creds"
}

module "vars-stg" {
  source = "../../../modules/vars/eu-west-1/stg"
}

module "vars-global" {
  source = "../../../modules/vars/eu-west-1/global"
}

module "nginx" {
  env = "stg"
  role = "webserver"

  # Loaded variables from prod module
  vpc_id               = "${module.vars-stg.vpc_id}"

  source             = "../../../modules/webserver"
}


