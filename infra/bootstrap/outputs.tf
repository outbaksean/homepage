output "state_bucket_name" {
  value = aws_s3_bucket.tfstate.bucket
}

output "lock_table_name" {
  value = aws_dynamodb_table.tfstate_lock.name
}

# Copy this block into infra/backend.tf after running bootstrap
output "backend_config_snippet" {
  value = <<-EOT
    terraform {
      backend "s3" {
        bucket         = "${aws_s3_bucket.tfstate.bucket}"
        key            = "cratervar/terraform.tfstate"
        region         = "${var.region}"
        dynamodb_table = "${aws_dynamodb_table.tfstate_lock.name}"
      }
    }
  EOT
}
