output "id" {
  description = "The ID of the security group"
  value       = var.create_sg ? aws_security_group.this[0].id : null
}

output "arn" {
  description = "The ID of the security group"
  value       = var.create_sg ? aws_security_group.this[0].arn : null
}

# output "ingress_security_group_rule_ids" {
#    value = aws_vpc_security_group_ingress_rule.this[*].arn
# }

# output "egress_security_group_rule_ids" {
#    value = aws_vpc_security_group_egress_rule.this[*].arn
# }
