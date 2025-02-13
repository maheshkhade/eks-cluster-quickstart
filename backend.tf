terraform {
  backend "s3" {
    bucket       = "mk-general-usage"
    key          = "terraform/eks/aps1/terraform.tfstate" # The path where the state file will be stored in the bucket
    region       = "us-east-1"
    encrypt      = true # Encrypt the state file at rest
    use_lockfile = true
  }
}