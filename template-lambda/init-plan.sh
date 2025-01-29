#!/bin/bash

# Define o diretório do Terraform 
terraform_dir="$(dirname "$(realpath "$0")")"

# Inicializa o Terraform
terraform init

# Executa o plan e o apply
terraform plan
terraform apply -auto-approve