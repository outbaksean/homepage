output "site_url" {
  description = "Live site URL"
  value       = "https://${var.domain_name}"
}

output "cloudfront_url" {
  description = "Direct CloudFront URL (usable before DNS is configured)"
  value       = "https://${module.cdn.cloudfront_domain_name}"
}

output "s3_bucket_name" {
  description = "S3 bucket name — set as S3_BUCKET in GitHub Actions secrets"
  value       = module.s3.bucket_id
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID — set as CLOUDFRONT_DISTRIBUTION_ID in GitHub Actions secrets"
  value       = module.cdn.cloudfront_distribution_id
}

output "github_actions_role_arn" {
  description = "IAM role ARN — set as AWS_ROLE_ARN in GitHub Actions secrets"
  value       = module.oidc.role_arn
}
