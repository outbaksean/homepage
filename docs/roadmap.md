# Roadmap

## Step 1 — Vue3 Placeholder App (done)

- Scaffold project with Vite + Vue3
- Pages: Home, Projects
- Home: name/bio placeholder, links to GitHub
- Projects: static list from `projects.md`
- Basic CSS (no framework, or pick one)
- Configure `vite.config.js` build output for S3 (no hash on index.html, etc.)
- Verify `npm run build` produces a clean `dist/`

## Step 2 — Terraform IaC (done)

- Terraform state backend: S3 bucket + DynamoDB lock table
- Resources:
  - S3 bucket (private, no static website hosting — served via CloudFront)
  - ACM certificate (us-east-1, required for CloudFront)
  - Route53 hosted zone + DNS validation record for cert
  - CloudFront distribution (S3 origin with OAC, HTTPS only, custom domain)
  - Route53 A/AAAA alias records pointing to CloudFront
  - Bucket policy granting CloudFront OAC read access
- Organize into modules: `s3`, `cdn`, `dns`
- Outputs: CloudFront URL, S3 bucket name

## Step 3 — GitHub Actions CI/CD (done)

- Store secrets: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`, `S3_BUCKET`, `CLOUDFRONT_DISTRIBUTION_ID`
- Workflow trigger: push to `main`
- Jobs:
  1. **Build**: `npm ci` → `npm run build`
  2. **Deploy**: `aws s3 sync dist/ s3://$S3_BUCKET --delete`
  3. **Invalidate**: `aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION_ID --paths "/*"`
- Consider a separate `terraform` workflow for IaC changes (plan on PR, apply on merge)

---

## Later Steps

### Content & Polish
- Replace placeholder content with real bio and project descriptions
- Add project links (GitHub repos, live demos)
- Choose and apply a consistent visual style/theme
- Add favicon (done) — Add basic SEO meta tags (`description`, OG tags)

### Blog
- Decide on blog approach: static MD files built at compile time vs. fetched at runtime
- Write initial posts from the topic list
- Add a blog index page and post routing

### Projects — OOTP Mission Calculator
- Clean up and prep for OOTP27 (deadline: March 13)
- Link from site with description and live URL

### Projects — HexGame
- Build web MVP
- Link from site once deployed

### Projects — ThreeJS Game
- Decide on isometric engine/approach
- Resolve art pipeline before committing to scope

### Operational
- Set up CloudFront logging or basic analytics (e.g. Plausible)
- Review IAM permissions — lock down deploy role to least privilege
- Add a staging environment or S3 prefix for preview deploys
- Configure CloudFront error pages (404 → index.html for SPA routing)
