# workflows

GitHub Actions CI/CD pipelines.

## To Do

### `deploy.yml`
- Trigger on push to `main`
- Jobs: install → build → `aws s3 sync dist/ s3://$S3_BUCKET --delete` → CloudFront invalidation
- Required secrets: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`, `S3_BUCKET`, `CLOUDFRONT_DISTRIBUTION_ID`

### `terraform.yml`
- On PR: run `terraform plan`, post output as PR comment
- On merge to `main`: run `terraform apply -auto-approve`
- Required secrets: AWS credentials + `TF_STATE_BUCKET`

## Notes

- IAM role used for deploys should be scoped to least privilege (S3 sync + CloudFront invalidation only)
- Consider OIDC-based auth (GitHub → AWS) to avoid long-lived access keys
