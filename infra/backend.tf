# Fill in after running infra/bootstrap and copying its outputs.
# See infra/README.md for instructions.

terraform {
  backend "s3" {
    bucket         = "cratervar-tfstate"
    key            = "cratervar/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cratervar-tfstate-lock"
  }
}
