# Architecture

## Infrastructure

- **CDN**: CloudFront with custom domain via Route53
- **Hosting**: S3 bucket (private, OAC-gated — not public static hosting)
- **TLS**: ACM certificate provisioned in us-east-1
- **DNS**: Route53 hosted zone, A/AAAA alias records → CloudFront
- **IaC**: Terraform with remote state (S3 + DynamoDB lock)
- **CI/CD**: GitHub Actions (build + deploy + cache invalidation)

## Frontend

- **Framework**: Vue3 with Vite
- **Routing**: Vue Router (hash or history mode)
- **Styling**: TBD — plain CSS or lightweight framework (e.g. UnoCSS)
- **Deployment**: `npm run build` → `dist/` synced to S3 via GitHub Actions

## Data Flow

```
User → Route53 DNS → CloudFront (HTTPS, edge cache)
                          ↓
                     S3 (origin, private)
```

## Directory Structure

```
homepage/
├── docs/                   # Project documentation
│   ├── ...
│
├── src/                    # Vue3 application
│   ├── ...
│
├── infra/                  # Terraform IaC
│   ├── ...
│
├── .github/
│   └── workflows/
│       ├── deploy.yml      # Build + deploy to S3
│       └── terraform.yml   # Plan on PR, apply on merge
```
