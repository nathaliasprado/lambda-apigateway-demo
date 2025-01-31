resource "aws_dynamodb_table" "dynamodb" {
  name           = "lambda-apigateway"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"
  range_key      = "GameTitle"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name     = "lambda-apigateway"
    ambiente = "DEV"
  }
}