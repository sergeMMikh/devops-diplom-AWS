resource "aws_s3_bucket" "backend_dd" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "BackendStorageBucket"
  }

  lifecycle {
    prevent_destroy = true
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

resource "aws_s3_bucket_public_access_block" "backend_dd_block" {
  bucket = aws_s3_bucket.backend_dd.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


# resource "aws_s3_object" "image" {
#   bucket                 = aws_s3_bucket.backend_dd.id
#   key                    = "cafe.jpg"
#   source                 = "images/cafe.jpg"
#   server_side_encryption = "AES256"

#   depends_on = [aws_s3_bucket.backend_dd]
# }

# Политика доступа для публичного чтения ... пока не нужна
# resource "aws_s3_bucket_policy" "backend_dd_policy" {
#   bucket = aws_s3_bucket.backend_dd.id
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Sid       = "PublicReadGetObject"
#         Effect    = "Allow"
#         Principal = "*"
#         Action    = "s3:GetObject"
#         Resource  = "${aws_s3_bucket.backend_dd.arn}/*"
#       }
#     ]
#   })
# }
