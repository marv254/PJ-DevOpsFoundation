terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

variable "domain_name" {
  description = "The name of the domain for our website."
  default = "explorecalifornia.ke"
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    actions = [ "s3:GetObject","s3:ListBucket", ]
    principals {
      type = "*"
      identifiers = [ "*" ]
    }
    resources = [ aws_s3_bucket.website.arn, "${aws_s3_bucket.website.arn}/*" ]
  }
}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
    bucket = aws_s3_bucket.website.bucket
    policy = data.aws_iam_policy_document.bucket_policy.json
}
resource "aws_s3_bucket_acl" "website_acl" {
  bucket = aws_s3_bucket.website.bucket
  acl    = "public-read"
}
resource "aws_s3_bucket" "website" {
  bucket = var.domain_name          // The name of the bucket.
}
resource "aws_s3_bucket_website_configuration" "website_config" {
    bucket = aws_s3_bucket.website.bucket
    
    index_document {
        suffix = "index.htm"
    }

    error_document {
        key = "error.htm"
    }
}

output "website_bucket_url" {
  value = aws_s3_bucket_website_configuration.website_config.website_endpoint
}