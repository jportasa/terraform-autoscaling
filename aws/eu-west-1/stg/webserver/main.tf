
provider "aws" {
  region = "eu-west-1"
  shared_credentials_file = "/Users/jporta/.aws/creds"
}

module "vars-stg" {
  source = "../../../../modules/vars/eu-west-1/stg"
}

module "vars-global" {
  source = "../../../../modules/vars/eu-west-1/global"
}


module "nginx" {
  env = "stg"
  bucket_name = "buget-stg"
  source             = "../../../../modules/webserver"
}



