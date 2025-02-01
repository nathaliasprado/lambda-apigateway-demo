variable "name" {
  description = "Name of the REST API."
  type        = string
  default     = "DynamoDBOperations"
}

variable "types" {
  description = "List of endpoint types. Valid values: EDGE, REGIONAL or PRIVATE. "
  type        = list(string)
  default     = ["REGIONAL"]
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

variable "path_part" {
  description = "Last path segment of this API resource."
  type        = string
  default     = "DynamoDBManager"
}

variable "http_method" {
  description = "HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)."
  type        = string
  default     = "POST"
}

variable "authorization" {
  description = "Type of authorization used for the method (NONE, CUSTOM, AWS_IAM, COGNITO_USER_POOLS)."
  type        = string
  default     = "NONE"
}

variable "function_name" {
  description = "Name of the Lambda Function."
  type        = string
  default     = "LambdaFunctionOverHttps"
}

variable "myregion" {
  description = "Region used to create the resources."
  type        = string
  default     = "us-east-1"
}

variable "accountId" {
  description = "Account ID."
  type        = number
  default     = 000000000000
}

variable "integration_http_method" {
  description = "Integration HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONs, ANY, PATCH) specifying how API Gateway will interact with the back end."
  type        = string
  default     = "POST"
}

variable "stage_name" {
  description = "Name of the stage."
  type        = string
  default     = "dev"
}