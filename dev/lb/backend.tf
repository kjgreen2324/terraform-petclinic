terraform {  
  backend "s3" {  
    bucket       = "tf-state-20250625"  
    key          = "dev/lb/terraform.tfstate"  
    region       = "ap-northeast-2"  
    encrypt      = true  
    use_lockfile = true
  }  
}