terraform {
  cloud {
    organization = "Gadgetools_Unlimited"

    workspaces {
      name = "Terra-House"
    }
  }
}

provider "aws" {
  # Configuration options
}
provider "random" {
  # Configuration options
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length   = 21
  special  = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
## Bucket Naming Rules
#https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result

}



output "random_bucket_name" {
  value = random_string.bucket_name.result
}
