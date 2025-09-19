terraform {  
  backend "s3" {  
    bucket       = "tf-state-20250625"  
    key          = "dev/network/route/terraform.tfstate"  
    region       = "ap-northeast-2"  
    encrypt      = true  
    use_lockfile = true
  }  
}