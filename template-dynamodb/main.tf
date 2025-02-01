resource "aws_dynamodb_table" "dynamodb" {
  name           = var.name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key

  dynamic "attribute" {
    for_each = var.attribute
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  tags = {
    Name        = var.name
    environment = var.environment
    repository  = var.repository
    terraform   = true
  }
}