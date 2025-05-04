resource "aws_s3_bucket" "s3_bucket_aninha" {
  bucket = "bucket-aninha-teste-finops-project"

  tags = {
    Name        = "bucket-aninha-teste-finops-project-v0"
    Environment = "Test"
  }
}

# Bucket dedicado para os logs
resource "aws_s3_bucket" "log_bucket" {
  bucket = "bucket-aninha-teste-finops-logs"

  tags = {
    Name        = "bucket-aninha-teste-finops-logs"
    Environment = "Test"
  }
}

# handle bucket ownership controls
resource "aws_s3_bucket_ownership_controls" "log_bucket_ownership" {
  bucket = aws_s3_bucket.log_bucket.id
  
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_s3_bucket_aninha" {
  bucket = aws_s3_bucket.s3_bucket_aninha.id
  rule {
    id     = "Delete"
    status = "Enabled"
    filter {
      prefix = "log/"
    }
    expiration {
      days = 30
    }
  }
}

# Habilitar ACLs para o bucket
resource "aws_s3_bucket_public_access_block" "log_bucket_public_access_block" {
  bucket = aws_s3_bucket.log_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "log_bucket_acl_test_aninha" {
  depends_on = [
    aws_s3_bucket_ownership_controls.log_bucket_ownership,
    aws_s3_bucket_public_access_block.log_bucket_public_access_block,
  ]

  bucket = aws_s3_bucket.log_bucket.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "logging_aninha_test" {
  bucket        = aws_s3_bucket.s3_bucket_aninha.id
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}

/* ----------  FinOps locals  ---------- */
locals {
  storage_cost_usd = var.estimated_cost_storage * var.price_per_gb
  request_cost_usd = (var.put_request_count / 1000) * var.price_per_1000_put
  monthly_cost_usd = local.storage_cost_usd + local.request_cost_usd
}