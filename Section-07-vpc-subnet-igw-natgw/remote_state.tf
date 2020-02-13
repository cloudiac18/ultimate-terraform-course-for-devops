#terraform {
#backend s3 {
#encrypt=true
#bucket = "terraformiac-mystach-tfstate"
#region = "us-east-1"
#dynamodb_table = "terraform-state"
#key="stage_vpc/terraform.tfstate"
#}
#}
