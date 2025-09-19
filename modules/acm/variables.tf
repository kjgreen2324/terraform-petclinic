
variable "alb_dns_name" {
  type = string
}

variable "alb_zone_id" {
  type = string
}

/*
variable "acm_cert_domain_validation_options" {
  description = "Domain validation options for ACM certificate"
  type        = list(object({
    domain_name           = string
    resource_record_name  = string
    resource_record_type  = string
    resource_record_value = string
  }))
}
*/
variable "certificate_arn" {
  description = "Domain validation options for ACM certificate"
}