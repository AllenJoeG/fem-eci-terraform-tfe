locals {
  project = {
    "fem-eci-project" = {
      description = "Project for Enterprise Cloud Infrastruture at Frontend Masters!"
    }
  }

  workspace = {
    "fem-eci-tfe" = {
      description    = "Workspace for learning Enterprise Cloud Infrastructure @ FEM"
      execution_mode = "local"
      project_id     = module.project["fem-eci-project"].id
    }
  }
}
