## Modules & Providers
  Modules and Providers for main.tf found at:
  Grab 'Provision Instructions' code

  terraform provider tfe > docs
  https://registry.terraform.io/providers/hashicorp/tfe/latest/docs

  or Erik's
  https://registry.terraform.io/namespaces/ALT-F4-LLC

  Modules don't have 'providers', they just have names. so a module takes 1 argument
  module "" {}

  and resources take two arguments of provider and name
  resource "" "" {}

## main.tf
  source can point to local files, module names, or even ssh to stuff
  
  module support is there right out of the box. In Terraform browser > Registry you can set up private modules.

  Terraform has an automated dependency tree generator. Anything listed here, it will know how to sort the order of the dependencies in order.

  Now implemented are for_each which will apply the locals

  ### vcs_repo
    added to workspace to link github data. Every workspace we create will have a repo, and will need that repository information. Terraform has to be able to access any linked and required repository.

  ### moved {}
    - when renaming things, you will need to point the previous name to new names with doing subsequent deployments or plan -outs and applies.
    - this will make sure that resources are properly attributed

## variables.tf
  set variables with type declarations that can be plugged into other .tf files

  Bring over github variables
  Github > settings > Integrations > Applications > Terraform Cloud
installation ID: '42283516'
This value needs to be added to fem-eci-terraform-tfe variables.tf along with github organization name

and repo_identifier

## locals.tf
  - we're going to plug in project and workspace attribute sets to run multiples. This data will plug into the module declarations in main.tf without conflict for easy configuration.
  - See between main.tf and locals.tf the commented out versions of hardcoding into main vs using these configurables.
  - it will do the dependency injection automatically (in this case, creating the projects which have no dependencies, and then injecting their output variables into workspace)

  - variables in aws network/cluster sections allows us to programmatically control our network settings from within the repo

## backend.tf
  - 

## data.tf
  pointing the github installation id as a data lookup (essentially API calling)