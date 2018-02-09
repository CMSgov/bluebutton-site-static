provider "aws" {
  region = "us-east-1"
}

##
# Data providers
##
data "template_file" "bucket_policy" {
  template = "${file("${path.module}/templates/bucket-policy.json")}"

  vars {
    bucket_name = "${var.bucket_name}"
  }
}

##
# S3 Bucket
##
resource "aws_s3_bucket" "main" {
  bucket = "${var.bucket_name}"
  acl    = "private"
  policy = "${data.template_file.bucket_policy.rendered}"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags {
    Name        = "${var.bucket_name}"
    environment = "${var.env}"
  }
}
