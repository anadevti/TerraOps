variable "estimated_cost_storage" {
  description = "Estimated cost of the storage gb"
  type        = number
  default     = 20
}

variable "put_request_count" {
  description = "Estimated cost of the put request for month"
  type        = number
  default     = 1000
}

/* Preços públicos (maio/2025) – S3 Standard, São Paulo (sa-east-1)
 * Armazenamento: USD 0.0340 por GB-mês
 * PUT/POST/LIST: USD 0.0054 por 1 000 req
 * (fonte: aws.amazon.com/s3/pricing)
 */
variable "price_per_gb" {
  type    = number
  default = 0.0340
}

variable "price_per_1000_put" {
  type    = number
  default = 0.0054
}