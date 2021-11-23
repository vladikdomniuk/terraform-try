terraform {
  backend "s3" {
    //bucket = "s3-terraform-bucket"
    bucket = "terraform-lorgar-remote-state"
    key    = "test/terraform"
    region = "eu-central-1"
  }
}
