# fem-eci-terraform-tfe
  This repository is the source of truth for configuring and deploying the Terraform cloud workspace.

## Initializing steps
  Github new repo > <fem-eci-terraform-tfe> 
    .gitignore template Terraform

## shell commands
  - terraform init 
  - (once a backend.tf file is in place, you will need to prepend init with doppler)
  - terraform validate (lints it, always do before push)

  - doppler run -- terraform plan -out "terraform.tfplan"
    (sets run config to a file stashed)
  - doppler run -- terraform apply "terraform.tfplan"

  - This is the entire terraform cycle. Initialize and validate locally then plan and apply to the cloud with doppler to pass through keys & env variables

## Team Error resolution
  The following code was initially in main.tf. Free users of Terraform do not have access to team functionality, and only have a single 'owner' team with up to 5 'users'. Attempting to deploy this code will raise a Team resource error.

  module "team" {
    source = "ALT-F4-LLC/team/tfe"
    version = "0.2.0"

    name = "fem-eci-team"
    organization_name = var.organization_name
    usernames = var.organization_usernames
  }

  There are code remnants in data.tf and variables.tf that show how we could try to solve it more declaratively if using a paid terraform account.

  There is one slight corner case to be aware of. If you had the team error, then added the backend.tf, it can create the workspace without the project (feature of TF Cloud with backend.tf). After finishing the teams fix above, it will give you a "resource not found" for fem-eci-project since it was not created. I had to manually remove the fem-eci-workspace in TF Cloud, then followed the same order: apply WITHOUT backend.tf, then add backend.tf and migrate state so that backend.tf doesn't create the workspace.

  https://support.hashicorp.com/hc/en-us/articles/6490710309139-How-to-create-a-new-workspace-using-the-backend-tf
  or
  team_ids = []
  or
  Comment out team_ids in main.tf if you don't have paid terraform plan