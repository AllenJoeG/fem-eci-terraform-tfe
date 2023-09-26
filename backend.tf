terraform {
  cloud {
    organization = "FEM-CloudInfra"

    workspaces {
      name = "fem-eci-workspace"
    }
  }
}
