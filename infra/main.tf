terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# ACM certificates for CloudFront must always be in us-east-1
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# -------------------------
# TLS Certificate
# -------------------------

resource "aws_acm_certificate" "site" {
  provider                  = aws.us_east_1
  domain_name               = var.domain_name
  subject_alternative_names = ["www.${var.domain_name}"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "site" {
  provider                = aws.us_east_1
  certificate_arn         = aws_acm_certificate.site.arn
  validation_record_fqdns = [for record in module.dns.validation_records : record.fqdn]
}

# -------------------------
# Modules
# -------------------------

module "s3" {
  source      = "./modules/s3"
  bucket_name = "${var.project_name}-site"
}

module "cdn" {
  source                         = "./modules/cdn"
  project_name                   = var.project_name
  domain_name                    = var.domain_name
  certificate_arn                = aws_acm_certificate_validation.site.certificate_arn
  s3_bucket_regional_domain_name = module.s3.bucket_regional_domain_name
}

module "dns" {
  source                    = "./modules/dns"
  domain_name               = var.domain_name
  cert_validation_options   = aws_acm_certificate.site.domain_validation_options
  cloudfront_domain_name    = module.cdn.cloudfront_domain_name
  cloudfront_hosted_zone_id = module.cdn.cloudfront_hosted_zone_id
}

# module "oidc" {
#   source                      = "./modules/oidc"
#   project_name                = var.project_name
#   github_org                  = var.github_org
#   github_repo                 = var.github_repo
#   s3_bucket_arn               = module.s3.bucket_arn
#   cloudfront_distribution_arn = module.cdn.cloudfront_distribution_arn
# }

# -------------------------
# S3 Bucket Policy
# Defined here (not in the s3 module) to avoid a circular dependency:
# S3 policy needs the CloudFront ARN, CloudFront needs the S3 domain name.
# -------------------------

resource "aws_s3_bucket_policy" "site" {
  bucket = module.s3.bucket_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontOAC"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${module.s3.bucket_arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = module.cdn.cloudfront_distribution_arn
          }
        }
      }
    ]
  })
}
