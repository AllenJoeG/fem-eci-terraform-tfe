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
      vcs_repo_identifier = "AllenJoeG/fem-eci-terraform-tfe"
    }
  }
}
