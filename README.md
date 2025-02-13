# eks-cluster-quickstart
This is a repo to create EKS cluster quickly to do the POC work and destroy the cluster after POC.

This terraform eks cluster creation assumes below resources already created on your AWS account.

1. s3 bucket to store terraform state. 
    - You can use your already created s3 bucket and change the bucket name in backend.tf file.
    - If you dont want to use s3 to store your state remove or delete backend.tf file

2. keypair named so that you can ssh into worker nodes of the cluster.
    add ec2_ssh_key name in main.tf file.

3. review the main.tf file carefully before apply.

4. to create cluster run 
    - terraform init
    - terraform plan
    - terraform apply