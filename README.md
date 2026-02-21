# cratervar.com

Personal homepage. Vue 3 SPA hosted on S3 + CloudFront, infrastructure managed with Terraform.

## Structure

```
.
├── app/        # Vue 3 + Vite frontend
├── infra/      # Terraform — S3, CloudFront, ACM, Route53
└── docs/       # Architecture notes
```

## Local development

```bash
cd app
npm install
npm run dev     # http://localhost:5173
```

## Deploy

Deployments are currently manual. From the repo root:

```bash
cd app && npm run build && cd ..
aws s3 sync app/dist/ s3://<bucket-name> --delete
aws cloudfront create-invalidation --distribution-id <id> --paths "/*"
```

GitHub Actions automation is planned — see `app/README.md`.

## Infrastructure

See `infra/README.md` for Terraform setup and usage.
