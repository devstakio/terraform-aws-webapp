resource "random_id" "random" {
  byte_length = 1
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.name}-${random_id.random.dec}"
  acl    = var.acl

  website {
    index_document = var.index_document
    error_document = var.error_document

    routing_rules = var.routing_rules
  }

  tags = merge(
    local.tags,
    var.tags
  )
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.s3_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.s3_bucket.arn]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }
}
