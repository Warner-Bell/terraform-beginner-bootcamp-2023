terraform {
  cloud {
    organization = "Gadgetools_Unlimited"
    workspaces {
      name = "Terra-House-2"
    }
  }
  #backend "remote" {
    #  hostname = "app.terraform.io"
    #  organization = "Gadgetools_Unlimited"

required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
 }


provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_soultrek_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.soultrek.public_path
  bucket_name = var.bucket_name
  content_version = var.soultrek.content_version
}

resource "terratowns_home" "home" {
  name = "SoulTrek 2023"
  description = <<DESCRIPTION
Soul Trek is a meme style pop culture parody adaptation of the science fiction tv series Star Trek TNG,
that followed the crew of a new starship Enterprise a century after the original series.
Soul Trek a series of images spoofing the characters and themes of the TNG tv series, explores the world
of intergalactic space travel with an element of funk. Town Concept Created by Warner Bell, Images Created by Karter AI Artz.
DESCRIPTION
  domain_name = module.home_soultrek_hosting.domain_name
  #domain_name = "4ytq3gz.cloudfront.net"
  town = "video-valley"
  content_version = var.soultrek.content_version
}


module "home_rccars_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.rccars.public_path
  bucket_name = var.bucket_name
  content_version = var.rccars.content_version
}

resource "terratowns_home" "home_rccars" {
  name = "RC Cars & Trucks"
  description = <<DESCRIPTION
There are some really cool and fun rc vehicles out there these days.
DESCRIPTION
  domain_name = module.home_rccars_hosting.domain_name
  #domain_name = "4ytq3gz.cloudfront.net"
  town = "missingo"
  content_version = var.rccars.content_version
}