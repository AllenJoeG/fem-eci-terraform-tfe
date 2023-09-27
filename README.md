# fem-eci-terraform-tfe

## shell commands
- terraform init
- terraform validate (lints it, always do before push)
- doppler run -- terraform plan -out "terraform.tfplan"
  (sets run config to a file stashed)
- terraform apply "terraform.tfplan"

## Team Error resolution
  There is one slight corner case to be aware of. If you had the team error, then added the backend.tf, it can create the workspace without the project (feature of TF Cloud with backend.tf). After finishing the teams fix above, it will give you a "resource not found" for fem-eci-project since it was not created. I had to manually remove the fem-eci-workspace in TF Cloud, then followed the same order: apply WITHOUT backend.tf, then add backend.tf and migrate state so that backend.tf doesn't create the workspace.

  https://support.hashicorp.com/hc/en-us/articles/6490710309139-How-to-create-a-new-workspace-using-the-backend-tf
  or
  team_ids = []
  or
  Comment out team_ids in main.tf if you don't have paid terraform plan