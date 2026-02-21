# Cost Estimates

## Summary

For a low-traffic personal portfolio site this stack should cost roughly **$1.50–$2.00/month**, almost entirely from Route53. Everything else either falls within a permanent free tier or is negligible at personal-project scale.

---

## AWS

### Route53

| Item | Cost |
|------|------|
| Hosted zone | $0.50/month |
| Domain registration (.com) | ~$1.00/month (~$12–15/year) |
| DNS queries | $0.40 per million — negligible at this scale |

**~$1.50/month**

> The hosted zone is the fixed cost you pay regardless of traffic. Domain price varies by TLD — check the [Route53 pricing page](https://aws.amazon.com/route53/pricing/) for your chosen extension.

---

### S3

| Item | Cost |
|------|------|
| Storage | $0.023/GB/month |
| PUT/LIST requests (deploys) | $0.005 per 1,000 requests |
| GET requests (served via CloudFront, not S3 directly) | minimal |

A built Vue app is typically under 5 MB. Storage cost is **< $0.01/month**. Requests from CloudFront to S3 origin are infrequent (cached at edge). Effectively **$0**.

---

### CloudFront

CloudFront has a **permanent free tier** (not time-limited):

| Free tier | Limit |
|-----------|-------|
| Data transfer out | 1 TB/month |
| HTTP/HTTPS requests | 10 million/month |

A personal portfolio site will comfortably stay within this. **$0/month** unless traffic unexpectedly spikes.

To estimate beyond the free tier: [CloudFront pricing calculator](https://aws.amazon.com/cloudfront/pricing/)

---

### ACM (TLS Certificate)

**Free** when used with CloudFront. No cost.

---

### DynamoDB (Terraform state lock table)

Free tier covers 25 GB storage + 25 read/write capacity units per month permanently. The lock table sees a handful of reads/writes per `terraform apply`. **$0/month**.

---

### AWS Total Estimate

| Service | Monthly |
|---------|---------|
| Route53 hosted zone | $0.50 |
| Domain (~$13/yr) | ~$1.08 |
| S3, CloudFront, ACM, DynamoDB | ~$0 |
| **Total** | **~$1.50–$2.00** |

Use the [AWS Pricing Calculator](https://calculator.aws) to model higher-traffic scenarios.

---

## GitHub

### Free Plan (sufficient for this project)

| Item | Free allowance |
|------|---------------|
| Private repositories | Unlimited |
| GitHub Actions minutes | 2,000 min/month |
| Packages storage | 500 MB |

### Actions Usage Estimate

| Workflow | Runtime | Frequency | Monthly minutes |
|----------|---------|-----------|-----------------|
| Deploy (build + S3 sync + invalidation) | ~2–3 min | ~10 deploys | ~25 min |
| Terraform plan (on PRs) | ~1–2 min | ~5 PRs | ~10 min |
| Terraform apply (on merge) | ~2–3 min | ~5 merges | ~15 min |
| **Total** | | | **~50 min** |

Well within the 2,000 min/month free allowance. **$0/month**.

> If you ever exceed free minutes, additional minutes are $0.008/min for Linux runners — still very cheap at this scale.

---

## Total

| | Monthly |
|--|---------|
| AWS | ~$1.50–$2.00 |
| GitHub | $0 |
| **Total** | **~$1.50–$2.00** |
