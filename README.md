# 🚀 How to Use:

1. Create a SP

2. Generate a JSON key
   
4. Upload it as `JSON` Repository secret

5. Upload the project_id as `PROJECTID` Repository secret

6. Trigger the workflow manually from the Actions tab in the GitHub repository
![](pics/proof0.jpg)

7. Enjoy your MLFLow!
![](pics/proof1.jpg)

# Resources Created

Google Kubernetes Engine (GKE) Cluster: Managed Kubernetes cluster to run containerized applications.

Google Compute Network: Custom VPC network to manage network traffic.

Google Compute Subnetwork: Subnets within the VPC to segment the network.

Google Storage Bucket: Object storage to store and retrieve any amount of data.

Google Storage Bucket: Object storage to store terraform state.

# 🔄 GitHub Actions Workflow

This repository includes a GitHub Actions workflow for deploying and destroying the Terraform infrastructure.

### Workflow: Deploy/Destroy Terraform

- **Trigger**: Manual (workflow_dispatch)
- **Inputs**:
  - `terraform-action`: Choose between 'apply' or 'destroy'
  - `google-loud-region`: GCP region (default: 'germanywestcentral')
  - `company`: Company name (default: 'spatially')
  - `environment`: Environment name (default: 'dev')
  - `gpu-node-required`: GPU Node Required (default: 'fasle')

### Key Steps:

1. Checkout repository
2. Install Terraform
3. Azure Login
4. Ensure Resource Group exists
5. Check/Create Azure Storage Account
6. Initialize Terraform
7. Format and Validate Terraform files
8. Plan Terraform changes
9. Apply or Destroy based on input

### Additional Features:

- Publishes Terraform plan as an artifact
- Creates a pull request for any automated formatting changes

# Pics

![](pics/proof_oreillyjpg)

![](pics/proof0.jpg)

![](pics/proof1.jpg)


