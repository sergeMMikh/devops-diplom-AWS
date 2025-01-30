terraform {
  backend "s3" {
    bucket  = "smmikh-dev-dip-2025-store-bucket"
    key     = "terraform/state.tfstate"
    region  = "eu-central-1"
    encrypt = true
    # dynamodb_table = "terraform-state-lock"
  }
}
