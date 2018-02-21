
provider "aws" {
  region = "eu-west-1"
  shared_credentials_file = "/Users/jporta/.aws/creds"
}

module "vars-stg" {
  source = "../../../modules/vars/eu-west-1/stg"
}


module "nginx" {
  env = "stg"
  role = "webserver"
  public_subnets_id = "${module.vars-stg.public_subnets_id}"

  # Loaded variables from prod module
  vpc_id               = "${module.vars-stg.vpc_id}"

  source             = "../../../modules/webserver"

}
