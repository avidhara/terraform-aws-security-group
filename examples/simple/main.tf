  #checkov:skip=CKV2_AWS_5:The Module does not cover attaching security groups to ENIs
module "secgrp-1" {
  source      = "../../"
  name        = "project-abc"
  description = "Managed by Terraform"

  vpc_id        = var.vpc_id
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules

  tags = {
    Tier       = "Application"
    Allocation = "1234"
  }
}
