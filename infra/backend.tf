
terraform {
  backend "s3" {
    bucket         = "it-general-bucket"
    key            = "terraform/state/flask-app.tfstate"
  }
}
