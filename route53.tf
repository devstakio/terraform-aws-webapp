data "aws_route53_zone" "hosted_zone" {
  zone_id = var.zone_id
}

resource "aws_route53_record" "route53_records" {
  count = length(local.subdomains)

  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name = local.subdomains[count.index]
  type = "A"

  alias {
    name = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}