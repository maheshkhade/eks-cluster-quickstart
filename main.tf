module "eks" {
  source                  = "./modules/eks"
  cluster_version         = "1.30"
  endpoint_private_access = true
  endpoint_public_access  = true
  public_access_cidrs     = ["0.0.0.0/0"]
  cluster_name            = "<enter-name-of-cluster>"
  commontag               = "<your-user-name>" #so that you can identify the resources created using this terraform module.
  ec2_ssh_key             = "<key-pair-name>" #it will be used in worker node ec2 instances. 
}
