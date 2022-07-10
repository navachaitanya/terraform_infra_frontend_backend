resource "aws_acm_certificate" "test_cert" {
  private_key      = file("./ssl/85419186_localhost.key")
  certificate_body = file("./ssl/85419186_localhost.cert")
  tags = { Name = "test_cert" }
}
