variable "vpc_id" {
  default = "vpc-0a93d6b34ea65ff73"
}

variable "ingress_rules" {
  default = {
    "http" = {
      cidr_ipv4   = "0.0.0.0/0"
      description = "allow 80"
      ip_protocol = "tcp"
      from_port   = 80
      to_port     = 80
    }
  }
}

variable "egress_rules" {
  default = {
    "allow-all" = {
      cidr_ipv4   = "10.0.0.0/16"
      description = "allow all"
      ip_protocol = "-1"
      from_port   = 0
      to_port     = 0
    }
  }
}
