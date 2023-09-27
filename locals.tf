locals {
  project = {
    "fem-eci-project" = {
      description = "Project for Enterprise Cloud Infrastruture at Frontend Masters!"
    }
  }

  workspace = {
    "fem-eci-tfe" = {
      description         = "Workspace for learning Enterprise Cloud Infrastructure @ FEM"
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-tfe"
    }
    "fem-eci-github" = {
      description         = "Workspace for Automating Github resources"
      execution_mode      = "remote" #has to start at local before state gets pushed to terraform
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-github"
    }
  }
}
