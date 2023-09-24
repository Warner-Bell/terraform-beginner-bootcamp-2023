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


module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
