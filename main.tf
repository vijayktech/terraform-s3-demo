# Configure AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Bucket names will be created "tz-tf-bucket-dev", "tz-tf-bucket-prod"
variable "s3_bucket_names" {
  type = list
  default = ["tz-tf-bucket-dev", "tz-tf-bucket-prod" ]
}

# It creates two buckets with above names
resource "aws_s3_bucket" "rugged_buckets" {
  count = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]
  force_destroy = true
}