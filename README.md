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
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7, < 0.14 |
| aws | >= 2.68, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.68, < 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | (Optional, Forces new resource) The security group description. Defaults to 'Managed by Terraform'. Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags. | `string` | `"Managed by Terraform"` | no |
| egress | (Optional, VPC only) Can be specified multiple times for each egress rule. Each egress block supports fields documented below. This argument is processed in <a href='https://www.terraform.io/docs/configuration/attr-as-blocks.html'>attribute-as-blocks</a> mode. | `any` | `[]` | no |
| ingress | (Optional) Can be specified multiple times for each ingress rule. Each ingress block supports fields documented below. This argument is processed in <a href='https://www.terraform.io/docs/configuration/attr-as-blocks.html'>attribute-as-blocks</a> mode. | `any` | `[]` | no |
| name | (Required, Forces new resource) The name of the security group. | `string` | n/a | yes |
| revoke\_rules\_on\_delete | (Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false | `bool` | `false` | no |
| tags | Map of tags to add to the resources | `map(string)` | `{}` | no |
| vpc\_id | (Required, Forces new resource) The VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ID of the security group |
| id | The ID of the security group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### ToDo
