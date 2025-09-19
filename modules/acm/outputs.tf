  output "certificate_arn" {
  value = aws_acm_certificate_validation.cert-va.certificate_arn
}

  output "certificate_cert" {
  value = aws_acm_certificate.cert
}
