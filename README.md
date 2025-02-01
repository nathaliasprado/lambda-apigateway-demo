# Lambda API Gateway Demo

Este repositório contém a infraestrutura para uma aplicação **serverless** na AWS, utilizando **Terraform** para provisionamento automático. A implementação da API utiliza **AWS Lambda, API Gateway e DynamoDB**, seguindo a estrutura do artigo [Tutorial: Uso do Lambda com API Gateway](https://docs.aws.amazon.com/pt_br/lambda/latest/dg/services-apigateway-tutorial.html).

## 🛠️ Tecnologias Utilizadas
- **Terraform**: Para provisionar e gerenciar a infraestrutura.
- **AWS Lambda**: Para executar código sem servidores.
- **API Gateway**: Para expor a Lambda como uma API REST.
- **DynamoDB**: Para armazenamento NoSQL de dados.

## 📂 Estrutura do Repositório
Cada diretório contém um **template Terraform** responsável pelo provisionamento do respectivo recurso:
- `template-apigateway/`: Responsável pela configuração do API Gateway.
- `template-lambda/`: Responsável pela configuração da função Lambda.
- `template-dynamodb/`: Responsável pela configuração do DynamoDB.

## 🚀 Como Utilizar

### **Pré-requisitos**
- Terraform instalado ([Guia de instalação](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)).
- AWS CLI configurado (`aws configure`).
- Credenciais com permissões adequadas.

### Passos
1. Clone este repositório:
    ```sh
    git clone https://github.com/seu-usuario/lambda-apigateway-demo
    cd lambda-apigateway-demo
    ```

2. Execute o script `init-plan.sh` em cada diretório:
    ```sh
    chmod +x template-apigateway/init-plan.sh
    ./template-apigateway/init-plan.sh

    chmod +x template-lambda/init-plan.sh
    ./template-lambda/init-plan.sh

    chmod +x template-dynamodb/init-plan.sh
    ./template-dynamodb/init-plan.sh
    ```

3. Obtenha a URL do API Gateway:
    ```sh
    terraform output api_gateway_url
    ```

4. Teste a API utilizando cURL ou Postman:
    - **Criar um item no DynamoDB via API Gateway**:
    ```sh
    curl -X POST https://SEU-API-GATEWAY-ID.execute-api.us-east-1.amazonaws.com/test/DynamoDBManager \
    -d '{"operation": "create", "payload": {"Item": {"id": "1234ABCD", "number": 10}}}'
    ```

    - **Consultar um item no DynamoDB**:
    ```sh
    curl -X GET https://SEU-API-GATEWAY-ID.execute-api.us-east-1.amazonaws.com/test/DynamoDBManager \
    -d '{"operation": "read", "payload": {"Key": {"id": "1234ABCD"}}}'
    ```

## 📖 Funcionalidades
- Exemplo de arquitetura serverless na AWS.
- Infraestrutura como Código (IaC) utilizando Terraform.
- Uso do API Gateway para expor endpoints públicos.
- Armazenamento persistente no DynamoDB.

## 📚 Origem do Projeto
Este projeto foi desenvolvido com base no artigo oficial da AWS [Uso do Lambda com API Gateway](https://docs.aws.amazon.com/pt_br/lambda/latest/dg/services-apigateway-tutorial.html), adaptado para Infraestrutura como Código utilizando Terraform.

## 🤝 Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.