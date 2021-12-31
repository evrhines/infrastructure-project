resource "aws_s3_bucket" "kops_bucket" {
  bucket = "kops-state"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    env     = var.env
    owner   = "SRE"
    contact = "evrhiness@gmail.com"
  }
}