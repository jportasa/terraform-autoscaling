resource "aws_s3_bucket" "b" {
  bucket = "${bucket_name}"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "{env}"
  }
}