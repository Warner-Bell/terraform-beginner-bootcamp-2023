

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
## Bucket Naming Rules
#https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
  #region = "us-east-1"  # Update the region here

  tags = {
    UserUuid = var.user_uuid
  }
}
