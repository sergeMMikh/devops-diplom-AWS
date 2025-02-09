resource "aws_eks_cluster" "eks" {
  name    = "${local.env}-${local.eks_name}"
  version = local.eks_version
  # role_arn = aws_iam_role.eks.arn
  role_arn = var.aws_iam_role_arn

  vpc_config {
    # endpoint_private_access = false
    endpoint_private_access = true
    endpoint_public_access  = true

    subnet_ids = var.subnet_ids
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

}
