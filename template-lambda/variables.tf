# DATA VARIABLES
variable "source_file" {
  description = "Package this file into the archive."
  type        = string
  default     = "LambdaFunctionOverHttps.py"
}

variable "output_path" {
  description = "The output of the archive file."
  type        = string
  default     = "function.zip"
}

# IAM VARIABLES
variable "role_name" {
  description = "Friendly name of the role."
  type        = string
  default     = "lambda-apigateway-role"
}

variable "environment" {
  description = "Resource environment (DEV, HML, PRD)."
  type        = string
  default     = "DEV"
}

variable "repository" {
  description = "Name of the repository."
  type        = string
  default     = "lambda-apigateway-demo"
}

variable "policy_name" {
  description = "Friendly name of the policy."
  type        = string
  default     = "lambda-apigateway-policy"
}

variable "description" {
  description = "Description of the IAM policy."
  type        = string
  default     = "Policy for Lambda and API Gateway"
}

#LAMBDA VARIABLES
variable "function_name" {
  description = "Unique name for your Lambda Function."
  type        = string
  default     = "LambdaFunctionOverHttps"
}

variable "handler" {
  description = "Function entrypoint in your code."
  type        = string
  default     = "LambdaFunctionOverHttps.lambda_handler"
}

variable "runtime" {
  description = "Identifier of the function's runtime."
  type        = string
  default     = "python3.12"
}