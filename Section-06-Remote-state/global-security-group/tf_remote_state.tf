terraform {
backend s3 {
encrypt=true
bucket = "terraformiac-mystach-tfstate"
key = "global_security_group/terraform.tfstate"
region = "us-east-1"
dynamodb_table = "terraform-state"
}
}