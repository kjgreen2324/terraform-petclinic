terraform {  
  backend "s3" {  
    bucket       = "tf-state-20250625"  
    key          = "dev/network/nat/terraform.tfstate"  
    region       = "ap-northeast-2"  
    encrypt      = true  
    use_lockfile = true
  }  
}