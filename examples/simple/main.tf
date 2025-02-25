#checkov:skip=CKV2_AWS_5:The Module does not cover attaching security groups to ENIs
module "secgrp-1" {
  source = "../../"
  name   = "project-abc"

  vpc_id  = var.vpc_id
  ingress = var.ingress
  egress  = var.egress

  tags = {
    Tier       = "Application"
    Allocation = "1234"
  }
}
