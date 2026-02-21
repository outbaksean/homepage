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

## Contributing

All changes go through a pull request — direct pushes to `main` are blocked.

```bash
git checkout -b your-branch-name
# make changes
git add .
git commit -m "describe the change"
git push -u origin your-branch-name
# open a PR on GitHub
```

On PR open: CI runs a build check (skipped if no `app/` changes). On merge to `main`: the site deploys automatically (skipped if no `app/` changes).

## Infrastructure

See `infra/README.md` for Terraform setup and usage.
