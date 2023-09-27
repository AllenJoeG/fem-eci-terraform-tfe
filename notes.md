## main.tf
  source can point to local files, module names, or even ssh to stuff
  
  module support is there right out of the box. In Terraform browser > Registry you can set up private modules.

  Terraform has an automated dependency tree generator. Anything listed here, it will know how to sort the order of the dependencies in order. 

  ## variables.tf
  set variables with type declarations that can be plugged into other .tf files

  