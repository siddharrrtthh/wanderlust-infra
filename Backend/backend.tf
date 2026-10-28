terraform {
  backend "s3" {
    bucket         = "wonderlust-bucket-2026"
    key            = "wonderlust/terraform.tfstate" // The key specifies where Terraform stores the state file inside your S3 bucket.
    region         = "us-east-2"
    dynamodb_table = "wonderlust-terraform-lock"
    encrypt        = true
  }
}
