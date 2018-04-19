resource "aws_iam_policy" "force_mfa" {
  name = "Force_MFA"
  path = "/"
  policy = "${var.allow_password_change_without_mfa ? data.aws_iam_policy_document.force_mfa_but_allow_sign_in_to_change_password.json : data.aws_iam_policy_document.force_mfa.json }"
}

resource "aws_iam_group_policy_attachment" "assign_force_mfa_policy_to_groups" {
  count = "${length(var.groups)}"
  group      = "${element(var.groups, count.index)}"
  policy_arn = "${aws_iam_policy.force_mfa.arn}"
}

resource "aws_iam_user_policy_attachment" "assign_force_mfa_policy_to_users" {
  count = "${length(var.users)}"
  user  = "${element(var.users, count.index)}"
  policy_arn = "${aws_iam_policy.force_mfa.arn}"
}
