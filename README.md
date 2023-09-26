# fem-eci-terraform-tfe

## shell commands
- terraform init
- terraform validate (lints it, always do before push)
- doppler run -- terraform plan -out "terraform.tfplan"
  (sets run config to a file stashed)
- terraform apply "terraform.tfplan"

Comment out [team_ids] in main.tf if you don't have paid terraform plan