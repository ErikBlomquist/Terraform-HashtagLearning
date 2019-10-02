## PROVIDER
provider "aws" {
    region = "us-west-2"
    profile = "admin-korkbots"
}
resource "aws_s3_bucket" "b" {
  bucket = "korkbots-test-bucket"
  acl    = "private"

  tags = {
    Name        = "korkbots-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "upload-object" {
  bucket = "${aws_s3_bucket.b.id}"
  key    = "testfile.txt"
  source = "testfiles/testfile.txt"
  etag = "${filemd5("testfiles/testfile.txt")}"
}

