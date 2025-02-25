#checkov:skip=CKV_AWS_382:The Module does not cover attaching security groups to ENIs
resource "aws_security_group" "this" {
  count       = var.create_sg ? 1 : 0
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  tags        = var.tags
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = var.ingress_rules

  security_group_id            = var.create_sg ? aws_security_group.this[0].id : lookup(each.value, "security_group_id", null)
  cidr_ipv4                    = lookup(each.value, "cidr_ipv4", null)
  cidr_ipv6                    = lookup(each.value, "cidr_ipv6", null)
  description                  = lookup(each.value, "description", null)
  from_port                    = lookup(each.value, "from_port", null)
  ip_protocol                  = lookup(each.value, "ip_protocol")
  prefix_list_id               = lookup(each.value, "prefix_list_id", null)
  referenced_security_group_id = lookup(each.value, "referenced_security_group_id", null)
  tags                         = lookup(each.value, "tags", {})
  to_port                      = lookup(each.value, "to_port", null)
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = var.egress_rules

  security_group_id            = var.create_sg ? aws_security_group.this[0].id : lookup(each.value, "security_group_id", null)
  cidr_ipv4                    = lookup(each.value, "cidr_ipv4", null)
  cidr_ipv6                    = lookup(each.value, "cidr_ipv6", null)
  description                  = lookup(each.value, "description", null)
  from_port                    = lookup(each.value, "from_port", null)
  ip_protocol                  = lookup(each.value, "ip_protocol")
  prefix_list_id               = lookup(each.value, "prefix_list_id", null)
  referenced_security_group_id = lookup(each.value, "referenced_security_group_id", null)
  tags                         = lookup(each.value, "tags", {})
  to_port                      = lookup(each.value, "to_port", null)
}
