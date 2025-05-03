output "monthly_s3_cost_estimate_usd" {
  description = "Estimativa de custo mensal do bucket (USD)"
  value = format(
    "≈ $%.2f / mês  [armazenamento: %.0f GB × $%.4f  |  %d PUT × $%.4f/1k]",
    local.monthly_cost_usd,
    var.estimated_cost_storage,
    var.price_per_gb,
    var.put_request_count,
    var.price_per_1000_put
  )
}