![Static security analysis for Terraform](https://github.com/foss-cafe/terraform-aws-security-group/workflows/Static%20security%20analysis%20for%20Terraform/badge.svg)

# Terraform Module for AWS Security Group

### Use as a Module

Go to [examples/simple](./examples/simple/) dir for more examples

```terraform
module "secgrp-1" {
  source = "../../"
  name   = "project-abc"
  description = "Managed by Terraform"

  vpc_id  = var.vpc_id
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules

  tags = {
    Tier       = "Application"
    Allocation = "1234"
  }
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.10.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_sg"></a> [create\_sg](#input\_create\_sg) | (Optional) Whether to create the security group. Defaults to true. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | (Required, Forces new resource) The security group description. Defaults to 'Managed by Terraform'. Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags. | `string` | n/a | yes |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | (Optional,  Map of egress Rules)<br/>  - security\_group\_id - (Optional) The security group to apply the rule to.<br/>  - cidr\_ipv4 - (Optional) The IPv4 CIDR range to allow. Cannot be specified with source\_security\_group\_id.<br/>  - cidr\_ipv6 - (Optional) The IPv6 CIDR range to allow. Cannot be specified with source\_security\_group\_id.<br/>  - description - (Optional) Description of this egress rule.<br/>  - from\_port - (Optional) The start port (or ICMP type number if protocol is "icmp" or "icmpv6").<br/>  - ip\_protocol - (Required) The protocol. If you select a protocol of "-1" (semantically equivalent to "all", which is not a valid value here), you must specify a "from\_port" and "to\_port" equal to 0. If you select a protocol of "icmp", you must specify a "from\_port" and "to\_port" where from\_port is the ICMP type and to\_port is the ICMP code. If you select a protocol of "58" (ICMPv6), you must specify a "from\_port" and "to\_port" where from\_port is the ICMP type and to\_port is the ICMP code.<br/>  - prefix\_list\_id - (Optional) The prefix list ID (or IPv6 prefix list ID for an egress rule) for an AWS service. Cannot be specified with cidr\_blocks and self.<br/>  - referenced\_security\_group\_id - (Optional) The security group id to allow access to/from, depending on the type. Cannot be specified with cidr\_blocks and self.<br/>  - tags - (Optional) A mapping of tags to assign to the resource.<br/>  - to\_port - (Required) The end range port (or ICMP code if protocol is "icmp" or "icmpv6"). If not specified, the value will default to from\_port. | <pre>map(object({<br/>    security_group_id            = optional(string)<br/>    cidr_ipv4                    = optional(string)<br/>    cidr_ipv6                    = optional(string)<br/>    description                  = optional(string)<br/>    from_port                    = optional(number)<br/>    ip_protocol                  = optional(string)<br/>    prefix_list_id               = optional(string)<br/>    referenced_security_group_id = optional(string)<br/>    tags                         = optional(map(string))<br/>    to_port                      = optional(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | (Optional,  Map of ingress Rules <br/>  - security\_group\_id - (Optional) The security group to apply the rule to.<br/>  - cidr\_ipv4 - (Optional) The IPv4 CIDR range to allow. Cannot be specified with source\_security\_group\_id.<br/>  - cidr\_ipv6 - (Optional) The IPv6 CIDR range to allow. Cannot be specified with source\_security\_group\_id.<br/>  - description - (Optional) Description of this egress rule.<br/>  - from\_port - (Optional) The start port (or ICMP type number if protocol is "icmp" or "icmpv6").<br/>  - ip\_protocol - (Required) The protocol. If you select a protocol of "-1" (semantically equivalent to "all", which is not a valid value here), you must specify a "from\_port" and "to\_port" equal to 0. If you select a protocol of "icmp", you must specify a "from\_port" and "to\_port" where from\_port is the ICMP type and to\_port is the ICMP code. If you select a protocol of "58" (ICMPv6), you must specify a "from\_port" and "to\_port" where from\_port is the ICMP type and to\_port is the ICMP code.<br/>  - prefix\_list\_id - (Optional) The prefix list ID (or IPv6 prefix list ID for an egress rule) for an AWS service. Cannot be specified with cidr\_blocks and self.<br/>  - referenced\_security\_group\_id - (Optional) The security group id to allow access to/from, depending on the type. Cannot be specified with cidr\_blocks and self.<br/>  - tags - (Optional) A mapping of tags to assign to the resource.<br/>  - to\_port - (Required) The end range port (or ICMP code if protocol is "icmp" or "icmpv6"). If not specified, the value will default to from\_port. | <pre>map(object({<br/>    security_group_id            = optional(string)<br/>    cidr_ipv4                    = optional(string)<br/>    cidr_ipv6                    = optional(string)<br/>    description                  = optional(string)<br/>    from_port                    = optional(number)<br/>    ip_protocol                  = string<br/>    prefix_list_id               = optional(string)<br/>    referenced_security_group_id = optional(string)<br/>    tags                         = optional(map(string))<br/>    to_port                      = optional(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required, Forces new resource) The name of the security group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (Required, Forces new resource) The VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ID of the security group |
| <a name="output_id"></a> [id](#output\_id) | The ID of the security group |
<!-- END_TF_DOCS -->

### ToDo

[ ]
