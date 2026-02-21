output "role_arn" {
  description = "IAM role ARN — set this as AWS_ROLE_ARN in GitHub Actions secrets"
  value       = aws_iam_role.github_actions.arn
}
