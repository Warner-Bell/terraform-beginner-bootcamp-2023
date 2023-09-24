terraform {
#   cloud {
#     organization = "Gadgetools_Unlimited"

#     workspaces {
#       name = "Terra-House"
#     }
#   }
# }

required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
  # Configuration options
}
provider "random" {
  # Configuration options
}