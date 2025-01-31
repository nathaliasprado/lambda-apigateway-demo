output "apigateway_arn" {
  description = "The ARN of API Gateway."
  value       = aws_api_gateway_rest_api.apigateway.arn
}