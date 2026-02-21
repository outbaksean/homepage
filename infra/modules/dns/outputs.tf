output "validation_records" {
  value = aws_route53_record.cert_validation
}

output "zone_id" {
  value = data.aws_route53_zone.site.zone_id
}
