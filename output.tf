output "test_acm_certificate" {
  value     = aws_acm_certificate.test_cert
  sensitive = true
}
