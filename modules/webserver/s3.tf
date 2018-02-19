resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket_name}"
  acl    = "private"

  tags {
    Name        = "my_bucket"
    Environment = "${var.env}"
  }
}