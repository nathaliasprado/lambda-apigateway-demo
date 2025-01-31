output "dynamodb_arn" {
  description = "The ARN of DynamoDB."
  value       = aws_dynamodb_table.dynamodb.arn
}