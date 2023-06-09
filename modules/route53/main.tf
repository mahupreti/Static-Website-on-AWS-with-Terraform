data "aws_route53_zone" "zone" {
  name         = "mupreti.com.np"
  private_zone = false
}

resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "mupreti.com.np"
  type    = "A"
  
  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
    evaluate_target_health = false
  }

}
