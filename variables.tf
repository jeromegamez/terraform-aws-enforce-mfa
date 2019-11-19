variable "groups" {
  description = "Enforce MFA for the members in these groups"
  type        = list(string)
  default     = []
}

variable "users" {
  description = "Enforce MFA for these users"
  type        = list(string)
  default     = []
}

variable "allow_password_change_without_mfa" {
  description = "Allow changing the user password without MFA"
  type        = string
  default     = "false"
}
