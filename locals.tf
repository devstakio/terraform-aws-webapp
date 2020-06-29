locals {
  tags = {
    Application = var.application
    Environment = var.environment
    BillingCode = var.billing_code
  }

  s3_origin_id = var.name
  subdomains = [
    for subdomain in var.subdomains:
      (subdomain == "" ? trimsuffix(data.aws_route53_zone.hosted_zone.name, ".") : "${subdomain}.${trimsuffix(data.aws_route53_zone.hosted_zone.name, ".")}")
  ]
}
