variable "project_name" {
  description = "Project name, used for OAC name"
  type        = string
}

variable "domain_name" {
  description = "Primary domain name"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the validated ACM certificate (must be in us-east-1)"
  type        = string
}

variable "s3_bucket_regional_domain_name" {
  description = "Regional domain name of the S3 origin bucket"
  type        = string
}
