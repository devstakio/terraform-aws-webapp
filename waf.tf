resource "aws_waf_web_acl" "http_auth" {
  name        = "${var.name}-http-auth"

  default_action {
    type = "BLOCK"
  }

  rules {
    action {
      type = "ALLOW"
    }

    priority = 1
    rule_id = aws_waf_rule.auth_rule.id
  }

  metric_name = replace("${var.name}-http-auth", "-", "")

  tags = merge(
    local.tags,
    var.tags
  )
}

resource "aws_waf_rule" "auth_rule" {
  name = "${var.name}-authorization_rule"
  metric_name = replace("${var.name}-authorization-rule", "-", "")

  predicates {
    data_id = aws_waf_byte_match_set.auth_byte_match.id
    negated = false
    type = "ByteMatch"
  }
}

resource "aws_waf_byte_match_set" "auth_byte_match" {
  name = "${var.name}-authorization"

  byte_match_tuples {
    text_transformation   = "NONE"
    target_string         = "DJ06qsQljEDf7a1QazMPpmue"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "authorization"
    }
  }
}