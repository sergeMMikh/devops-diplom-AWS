resource "aws_s3_bucket" "backend_dd" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "BackendStorageBucket"
  }

  lifecycle {
    prevent_destroy = false
  }
}

# Конфигурация шифрования бакета по умолчанию
resource "aws_s3_bucket_server_side_encryption_configuration" "backend_dd_sse" {
  bucket = aws_s3_bucket.backend_dd.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Конфигурайия доступа к ресурсу.
resource "aws_s3_bucket_public_access_block" "backend_dd_block" {
  bucket = aws_s3_bucket.backend_dd.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
