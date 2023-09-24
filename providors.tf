terraform {
#   cloud {
#     organization = "Gadgetools_Unlimited"

#     workspaces {
#       name = "Terra-House"
#     }
#   }
# }

required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
provider "random" {
  # Configuration options
}