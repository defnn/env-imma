provider "aws" {
  region = "${var.provider_region}"
}

module "env" {
  source = "../module-aws-env"

  provider_region = "${var.provider_region}"

  vpc_name = "${var.vpc_name}"
  vpc_cidr = "${var.vpc_cidr}"

  az_count = "${length(split(" ",var.az_names))}"
  az_names = "${var.az_names}"

  nat_cidrs = "${var.nat_cidrs}"

  bucket_remote_state = "${var.bucket_remote_state}"
  context_org = "${var.context_org}"
}

module "consul" {
  source = "../module-aws-app"

  provider_region = "${var.provider_region}"

  vpc_name = "${var.vpc_name}"
}
