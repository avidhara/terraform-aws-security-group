![Static security analysis for Terraform](https://github.com/foss-cafe/terraform-aws-security-group/workflows/Static%20security%20analysis%20for%20Terraform/badge.svg)
# Terraform Module for AWS Security Group

### Use as a Module
Go to `examples` dir for more examples
```terraform
module "secgrp-1" {
  source = "./"
  name   = "project-abc"

  vpc_id  = var.vpc_id
  ingress = var.ingress
  egress  = var.egress

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | (Optional, Forces new resource) The security group description. Defaults to 'Managed by Terraform'. Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags. | `string` | `"Managed by Terraform"` | no |
| <a name="input_egress"></a> [egress](#input\_egress) | (Optional, VPC only) Can be specified multiple times for each egress rule. Each egress block supports fields documented below. This argument is processed in <a href='https://www.terraform.io/docs/configuration/attr-as-blocks.html'>attribute-as-blocks</a> mode. | `any` | `[]` | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | (Optional) Can be specified multiple times for each ingress rule. Each ingress block supports fields documented below. This argument is processed in <a href='https://www.terraform.io/docs/configuration/attr-as-blocks.html'>attribute-as-blocks</a> mode. | `any` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required, Forces new resource) The name of the security group. | `string` | n/a | yes |
| <a name="input_revoke_rules_on_delete"></a> [revoke\_rules\_on\_delete](#input\_revoke\_rules\_on\_delete) | (Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to add to the resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (Required, Forces new resource) The VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ID of the security group |
| <a name="output_id"></a> [id](#output\_id) | The ID of the security group |
<!-- END_TF_DOCS -->

### ToDo
[ ] 