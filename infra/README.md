# infra

Terraform IaC for AWS infrastructure.

## One-Time Manual Setup (AWS Console)

These steps cannot be automated via Terraform and must be done once by hand before anything else.

### 1. Purchase Domain (Route53)

- Go to **Route53 → Registered Domains → Register Domain**
- Purchase your domain — this creates a hosted zone automatically
- Note the hosted zone ID for use in Terraform variables

### 2. Create Terraform State Backend (Bootstrap)

The Terraform state itself needs somewhere to live before Terraform can manage anything. This chicken-and-egg problem is solved with a one-time manual bootstrap.

Two options:

**Option A — Manual (simplest)**
In the AWS Console:

1. Create an S3 bucket (e.g. `cratervar-tfstate`) with versioning enabled and public access blocked
2. Create a DynamoDB table (e.g. `cratervar-tfstate-lock`) with partition key `LockID` (String)

**Option B — Bootstrap Terraform config**
Run the separate `infra/bootstrap/` config (no remote state, uses local state) to create the above resources, then never touch it again.

### 3. Create IAM User/Role for GitHub Actions

- Create an IAM user or OIDC role with permissions scoped to:
  - `s3:PutObject`, `s3:DeleteObject`, `s3:ListBucket` on the site bucket
  - `cloudfront:CreateInvalidation` on the distribution
- Store credentials as GitHub Actions secrets

---

## Bootstrap Directory (`bootstrap/`)

A minimal standalone Terraform config that creates the remote state infrastructure.
Uses **local state** (committed or discarded after apply — it only manages two resources).

```
bootstrap/
├── main.tf       # S3 bucket (versioned) + DynamoDB lock table
├── variables.tf  # bucket name, table name, region
└── outputs.tf    # bucket name, table name to copy into backend.tf
```

Run once:

```sh
cd infra/bootstrap
terraform init
terraform apply
# copy outputs into infra/backend.tf, then never run this again
```

---

## Main Terraform Config

After bootstrap, the main config manages all site infrastructure.

`backend.tf` must reference the bucket and table created in bootstrap:

```hcl
terraform {
  backend "s3" {
    bucket         = "cratervar-tfstate"
    key            = "cratervar/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cratervar-tfstate-lock"
  }
}
```

---

## Directory Structure

```
infra/
├── bootstrap/              # One-time remote state setup (local state)
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── modules/
│   ├── s3/                 # Private origin bucket + OAC + bucket policy
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── cdn/                # CloudFront distribution + ACM cert (us-east-1)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── dns/                # Route53 records + cert validation
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf                 # Root config, calls modules
├── variables.tf            # domain_name, region, project_name, etc.
├── outputs.tf              # CloudFront URL, S3 bucket name
└── backend.tf              # Remote state config (fill in after bootstrap)
```

---

## Local Usage

### Prerequisites

Install the following on Windows before running any Terraform commands.

**Terraform**

```powershell
winget install Hashicorp.Terraform
```

Verify: `terraform -version`

**AWS CLI**

```powershell
winget install Amazon.AWSCLI
```

Verify: `aws --version`

**Configure AWS credentials**

If using IAM access keys (local dev only — CI/CD uses OIDC):

```powershell
aws configure
# Prompts for: Access Key ID, Secret Access Key, region (us-east-1), output format (json)
```

Credentials are stored in `~\.aws\credentials`. Verify with:

```powershell
aws sts get-caller-identity
```

---

### First-Time Setup (Bootstrap)

Run once to create the remote state bucket and lock table:

```powershell
cd infra\bootstrap
copy terraform.tfvars.example terraform.tfvars   # then fill in values
terraform init
terraform apply
```

Copy the `backend_config_snippet` output into `infra\backend.tf`, replacing the placeholder values.

---

### Running the Main Config

```powershell
cd infra
copy terraform.tfvars.example terraform.tfvars   # then fill in your domain, github_org, etc.
terraform init
```

**Plan** (dry run — always do this first):

```powershell
terraform plan
```

**Apply**:

```powershell
terraform apply
```

Terraform will show the plan again and prompt for confirmation before making changes.

**After apply**, note the outputs — you'll need these for GitHub Actions secrets:

```powershell
terraform output
```

---

### Subsequent Changes

```powershell
terraform plan    # review what will change
terraform apply   # apply after confirming the plan looks correct
```

State is stored remotely in S3 so this works from any machine with valid AWS credentials.

---

## To Do

- Complete one-time manual setup (domain purchase, bootstrap)
- Implement `bootstrap/` config
- Implement modules: `s3`, `cdn`, `dns`
- Fill in `backend.tf` after bootstrap
- Define all variables and outputs
- Test with `terraform plan` before first `apply`

## Notes

- ACM cert **must** be provisioned in `us-east-1` regardless of primary region
- Do not enable S3 static website hosting — serve exclusively through CloudFront
- Route53 hosted zone may already exist if the domain was purchased via Route53 console — import it rather than creating a new one (`terraform import aws_route53_zone.main <ZONE_ID>`)
