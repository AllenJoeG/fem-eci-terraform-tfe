# module "team" {
#   source = "ALT-F4-LLC/team/tfe"
#   version = "0.2.0"

#   name = "fem-eci-team"
#   organization_name = var.organization_name
#   usernames = var.organization_usernames
# }

module "project" {
  source  = "ALT-F4-LLC/project/tfe"
  version = "0.4.0"

  description       = "Following FEM Enterprise Cloud Infrastructure course"
  name              = "fem-eci-project"
  organization_name = var.organization_name
  # team_ids          = [var.team_id]
}

module "workspace" {
  source  = "ALT-F4-LLC/workspace/tfe"
  version = "0.6.0"

  description       = "Still following FEM Enterprise Cloud Infrastructure"
  execution_mode    = "local"
  name              = "fem-eci-workspace"
  organization_name = var.organization_name
  project_id        = module.project.id
}
