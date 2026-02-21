variable "project_name" {
  description = "Project name, used for IAM role naming"
  type        = string
}

variable "github_org" {
  description = "GitHub organization or username"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 site bucket"
  type        = string
}

variable "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution"
  type        = string
}

variable "create_oidc_provider" {
  description = "Set to false if the GitHub OIDC provider already exists in this AWS account"
  type        = bool
  default     = true
}
