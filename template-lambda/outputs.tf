output "role_arn" {
  description = "The ARN of IAM Role."
  value       = aws_iam_role.role.arn
}

output "lambda_arn" {
  description = "The ARN of Lambda."
  value       = aws_lambda_function.lambda.arn
}