resource "aws_iam_policy" "policy" {
  name        = "lambda-apigateway-policy"
  path        = "/"
  description = "Policy for Lambda and API Gateway"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:DeleteItem",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:Query",
        "dynamodb:Scan",
        "dynamodb:UpdateItem"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "attach" {
  name       = "lambda-apigateway-attachment"
  roles      = [aws_iam_role.role.name]
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_role" "role" {
  name = "lambda-apigateway-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name = "lambda-apigateway-role"
  }
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "LambdaFunctionOverHttps.py"
  output_path = "function.zip"
}

resource "aws_lambda_function" "lambda" {
  filename      = "function.zip"
  function_name = "LambdaFunctionOverHttps"
  role          = aws_iam_role.role.arn
  handler       = "LambdaFunctionOverHttps.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.12"

  environment {
    variables = {
      Name           = "LambdaFunctionOverHttps"
      funcionalidade = "portfólio"
      ambiente       = "DEV"
    }
  }
}