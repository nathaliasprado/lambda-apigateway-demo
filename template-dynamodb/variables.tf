variable "name" {
  description = "Unique within a region name of the table."
  type        = string
  default     = "lambda-apigateway"
}

variable "billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST."
  type        = string
  default     = "PROVISIONED"
}

variable "read_capacity" {
  description = "Number of read units for this table. If the billing_mode is PROVISIONED, this field is required."
  type        = number
  default     = 20
}

variable "write_capacity" {
  description = "Number of write units for this table. If the billing_mode is PROVISIONED, this field is required."
  type        = number
  default     = 20
}

variable "hash_key" {
  description = "Attribute to use as the hash (partition) key."
  type        = string
  default     = "id"
}

variable "attribute" {
  description = "Set of nested attribute definitions. Only required for hash_key and range_key attributes."
  type = list(object({
    name = string
    type = string
  }))

  default = [
    {
      name = "id"
      type = "S"
    }
  ]
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