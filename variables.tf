variable "create_sg" {
  type        = bool
  description = "(Optional) Whether to create the security group. Defaults to true."
  default     = true
}

variable "name" {
  type        = string
  description = "(Required, Forces new resource) The name of the security group."
}

variable "description" {
  type        = string
  description = "(Required, Forces new resource) The security group description. Defaults to 'Managed by Terraform'. Cannot be \"\". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags."
}

variable "ingress_rules" {
  type = map(object({
    security_group_id            = optional(string)
    cidr_ipv4                    = optional(string)
    cidr_ipv6                    = optional(string)
    description                  = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = string
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    tags                         = optional(map(string))
    to_port                      = optional(string)
  }))
  description = <<_EOT
  (Optional,  Map of ingress Rules 
  - security_group_id - (Optional) The security group to apply the rule to.
  - cidr_ipv4 - (Optional) The IPv4 CIDR range to allow. Cannot be specified with source_security_group_id.
  - cidr_ipv6 - (Optional) The IPv6 CIDR range to allow. Cannot be specified with source_security_group_id.
  - description - (Optional) Description of this egress rule.
  - from_port - (Optional) The start port (or ICMP type number if protocol is "icmp" or "icmpv6").
  - ip_protocol - (Required) The protocol. If you select a protocol of "-1" (semantically equivalent to "all", which is not a valid value here), you must specify a "from_port" and "to_port" equal to 0. If you select a protocol of "icmp", you must specify a "from_port" and "to_port" where from_port is the ICMP type and to_port is the ICMP code. If you select a protocol of "58" (ICMPv6), you must specify a "from_port" and "to_port" where from_port is the ICMP type and to_port is the ICMP code.
  - prefix_list_id - (Optional) The prefix list ID (or IPv6 prefix list ID for an egress rule) for an AWS service. Cannot be specified with cidr_blocks and self.
  - referenced_security_group_id - (Optional) The security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks and self.
  - tags - (Optional) A mapping of tags to assign to the resource.
  - to_port - (Required) The end range port (or ICMP code if protocol is "icmp" or "icmpv6"). If not specified, the value will default to from_port.
  _EOT
  default     = {}
}

variable "egress_rules" {
  type = map(object({
    security_group_id            = optional(string)
    cidr_ipv4                    = optional(string)
    cidr_ipv6                    = optional(string)
    description                  = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = optional(string)
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    tags                         = optional(map(string))
    to_port                      = optional(string)
  }))
  description = <<_EOT
  (Optional,  Map of egress Rules)
  - security_group_id - (Optional) The security group to apply the rule to.
  - cidr_ipv4 - (Optional) The IPv4 CIDR range to allow. Cannot be specified with source_security_group_id.
  - cidr_ipv6 - (Optional) The IPv6 CIDR range to allow. Cannot be specified with source_security_group_id.
  - description - (Optional) Description of this egress rule.
  - from_port - (Optional) The start port (or ICMP type number if protocol is "icmp" or "icmpv6").
  - ip_protocol - (Required) The protocol. If you select a protocol of "-1" (semantically equivalent to "all", which is not a valid value here), you must specify a "from_port" and "to_port" equal to 0. If you select a protocol of "icmp", you must specify a "from_port" and "to_port" where from_port is the ICMP type and to_port is the ICMP code. If you select a protocol of "58" (ICMPv6), you must specify a "from_port" and "to_port" where from_port is the ICMP type and to_port is the ICMP code.
  - prefix_list_id - (Optional) The prefix list ID (or IPv6 prefix list ID for an egress rule) for an AWS service. Cannot be specified with cidr_blocks and self.
  - referenced_security_group_id - (Optional) The security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks and self.
  - tags - (Optional) A mapping of tags to assign to the resource.
  - to_port - (Required) The end range port (or ICMP code if protocol is "icmp" or "icmpv6"). If not specified, the value will default to from_port.
  _EOT
  default     = {}
}

# variable "revoke_rules_on_delete" {
#   type        = bool
#   description = "(Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false"
#   default     = false
# }

variable "vpc_id" {
  type        = string
  description = "(Required, Forces new resource) The VPC ID."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
