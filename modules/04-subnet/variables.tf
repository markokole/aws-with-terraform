variable "path_in_consul" {
  default   = "test/master/aws"
}
variable "consul_server" {
  default   = "127.0.0.1"
}
variable "consul_port" {
  default   = "8500"
}
variable "datacenter" {
  default   = "dc1"
}

data "consul_keys" "app" {
  key {
    name    = "region"
    path    = "${var.path_in_consul}/region"
  }
  key {
    name    = "path_to_generated_aws_properties"
    path    = "${var.path_in_consul}/path_to_generated_aws_properties"
  }
  key {
    name    = "cidr_block"
    path    = "${var.path_in_consul}/cidr_block"
  }
  key {
    name    = "availability_zone"
    path    = "${var.path_in_consul}/availability_zone"
  }
  key {
    name    = "subnet_name"
    path    = "${var.path_in_consul}/subnet_name"
  }
  key {
    name    = "map_public_ip_on_launch"
    path    = "${var.path_in_consul}/map_public_ip_on_launch"
  }
}

data "consul_keys" "aws" {
  key {
    name    = "vpc_id"
    path    = "${local.path_to_generated_aws_properties}/vpc_id"
  }

}
