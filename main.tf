terraform {
#   cloud {
#     organization = "Gadgetools_Unlimited"
#     workspaces {
#       name = "Terra-House"
#     }
#   }

required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "Gadgetools_Unlimited"

 }


provider "terratowns" {
  endpoint = "http://localhost:4567/api"
  user_uuid="e328f4ab-b99f-421c-84c9-4ccea042c7d1" 
  token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}

# module "terrahouse_aws" {
#   source = "./modules/terrahouse_aws"
#   user_uuid = var.user_uuid
#   bucket_name = var.bucket_name
#   index_html_filepath = var.index_html_filepath
#   error_html_filepath = var.error_html_filepath
#   assets_path = var.assets_path
#   content_version = var.content_version
# }


resource "terratowns_home" "home" {
  name = "SoulTrek 2023"
  description = <<DESCRIPTION
Soul Trek is a meme style pop culture parody adaptation of the science fiction tv series Star Trek TNG,
that followed the crew of a new starship Enterprise a century after the original series.
Soul Trek a series of images spoofing the characters and themes of the TNG tv series, explores the world
of intergalactic space travel with an element of funk. Created by Karter AI Artz(https://www.facebook.com/profile.php?id=100093549192294).
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "4ytq3gz.cloudfront.net"
  town = "gamers-grotto"
  content_version = 1
}