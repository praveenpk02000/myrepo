terraform {
backend "s3"{
    bucket         = "type the name of your bucket"
    key            = "dev/terraform.tfstate"
    encrypt        = true
    region         = "type your region"
  }
}