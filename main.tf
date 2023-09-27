# /// Direct module declaration of project and workspaces

# module "project" {
#   source  = "ALT-F4-LLC/project/tfe"
#   version = "0.4.0"

#   description       = "Following FEM Enterprise Cloud Infrastructure course"
#   name              = "fem-eci-project"
#   organization_name = var.organization_name
#   # team_ids          = [var.team_id]
# }

# module "workspace" {
#   source  = "ALT-F4-LLC/workspace/tfe"
#   version = "0.6.0"

#   description       = "Still following FEM Enterprise Cloud Infrastructure"
#   execution_mode    = "local"
#   name              = "fem-eci-workspace"
#   organization_name = var.organization_name
#   project_id        = module.project.id
# }

# /// Locals module declaration pointing to locals and navigating to their values

module "project" {
  for_each = local.project

  source  = "ALT-F4-LLC/project/tfe"
  version = "0.4.0"

  description       = each.value.description
  name              = each.key
  organization_name = var.organization_name
}

module "workspace" {
  for_each = local.workspace

  source  = "ALT-F4-LLC/workspace/tfe"
  version = "0.6.0"

  description       = each.value.description
  execution_mode    = each.value.execution_mode
  name              = each.key
  organization_name = var.organization_name
  project_id        = each.value.project_id
  variables         = try(each.value.variables, [])

  vcs_repo = {
    github_app_installation_id = data.tfe_github_app_installation.this.id
    identifier                 = each.value.vcs_repo_identifier
  }
}

moved {
  from = module.workspace["fem-eci-workspace"]
  to   = module.workspace["fem-eci-tfe"]
}

# Migrating the original straight declarations to the local implementations.

# moved {
#   from = module.workspace
#   to   = module.workspace["fem-eci-workspace"]
# }
# moved {
#   from = module.project
#   to   = module.project["fem-eci-project"]
# }
