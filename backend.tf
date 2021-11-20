terraform {
  backend "s3" {
    bucket = "s3-terraform-bucket"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}
