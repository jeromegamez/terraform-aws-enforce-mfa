# AWS MFA Terraform module

Terraform module to enforce MFA for AWS groups and users.

This module implements the instructions provided in the AWS Documentation: [Enable Your Users to Configure Their Own Credentials and MFA Settings](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_users-self-manage-mfa-and-creds.html).

This version of the module uses terraform v0.12.x. If you want to use a previous version of terraform please use the release 1.0.0 of this module.

## Usage

```tf

resource "aws_iam_group" "mfa_group" {
  name = "MFAGroup"
}

resource "aws_iam_user" "mfa_user" {
  name = "MFAUser"
}

module "aws-enforce-mfa" {
  source = "jeromegamez/enforce-mfa/aws"
  groups = [aws_iam_group.mfa_group.name]
  users  = [aws_iam_user.mfa_user.name]
}
```

## Module input variables

- `groups` Enforce MFA for the members in these groups (Default: _[]_)
- `users` Enforce MFA for these users (Default: _[]_)
- `allow_password_change_without_mfa` (Default: _"false"_)

## License

MIT licensed. See LICENSE for full details.
