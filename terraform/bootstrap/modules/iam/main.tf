# IAM Role
resource "aws_iam_role" "dd-service-role" {
  name = var.role_name

  # Политика доверия
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        # создает IAM роль
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          # кто имеет право использовать эту роль
          Service = [
            "ec2.amazonaws.com",
            "s3.amazonaws.com",
            "logs.amazonaws.com",
            "apigateway.amazonaws.com"
          ]
        }
      }
    ]
  })
}

resource "aws_iam_policy" "s3_write_policy" {
  name        = var.policy_name
  description = "Allow EC2 instances to write files to S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:PutObjectAcl"
        ],
        # Применяется к ресурсам внутри S3-бакета, который указывается в переменной
        # Resource = "arn:aws:s3:::${var.s3_bucket_name}/*"
        Resource = "arn:aws:s3:::hw-smmikh-january-2025-store-bucket/*"
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  role = aws_iam_role.dd-service-role.name
  # ARN (Amazon Resource Name) IAM политики
  policy_arn = aws_iam_policy.s3_write_policy.arn
}


