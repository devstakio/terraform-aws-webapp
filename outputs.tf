output "s3_bucket_name" {
  value = aws_s3_bucket.s3_bucket.id
}

output "arn" {
  value = aws_s3_bucket.s3_bucket.arn
}

output "website_endpoint" {
  value = aws_s3_bucket.s3_bucket.arn
}

output "website_domain" {
  value = aws_s3_bucket.s3_bucket.arn
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}

output "webapp_domain_names" {
  value = aws_route53_record.route53_records.*.fqdn
}