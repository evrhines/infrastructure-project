resource "aws_s3_bucket" "kops_bucket" {
  bucket = "kops-state"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    env     = var.env
    owner   = "SRE"
    contact = "evrhiness@gmail.com"
  }
}