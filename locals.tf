locals {
  name       = "eks-lab"
  domain     = "lab.yacquub.com"
  region     = "eu-west-2"
  account_id = "528757784671"


  tags = {
    environment = "sandbox"
    project     = "EKS Advanced Lab"
    owner       = "Yacquub"
  }
}