variable "domain_name" {
  description = "Primary domain name"
  type        = string
}

variable "cert_validation_options" {
  description = "Domain validation options from the ACM certificate resource"
  type = set(object({
    domain_name           = string
    resource_record_name  = string
    resource_record_type  = string
    resource_record_value = string
  }))
}

variable "cloudfront_domain_name" {
  description = "CloudFront distribution domain name for alias records"
  type        = string
}

variable "cloudfront_hosted_zone_id" {
  description = "CloudFront hosted zone ID for alias records"
  type        = string
}
