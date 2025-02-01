import json
import boto3
from decimal import Decimal

# Função para converter Decimal em int/float
def decimal_converter(obj):
    if isinstance(obj, Decimal):
        return int(obj) if obj % 1 == 0 else float(obj)
    raise TypeError

# Define o DynamoDB
table_name = "lambda-apigateway"
dynamo = boto3.resource('dynamodb').Table(table_name)

# CRUD functions
def create(payload):
    return dynamo.put_item(Item=payload['Item'])

def read(payload):
    return dynamo.get_item(Key=payload['Key'])

def update(payload):
    return dynamo.update_item(**{k: payload[k] for k in ['Key', 'UpdateExpression', 
    'ExpressionAttributeNames', 'ExpressionAttributeValues'] if k in payload})

def delete(payload):
    return dynamo.delete_item(Key=payload['Key'])

def echo(payload):
    return payload

operations = {
    'create': create,
    'read': read,
    'update': update,
    'delete': delete,
    'echo': echo,
}

def lambda_handler(event, context):
    try:
        # Converte o body de string JSON para dicionário
        if isinstance(event.get("body"), str):
            event = json.loads(event["body"])
        
        operation = event['operation']
        payload = event['payload']
        
        if operation in operations:
            response = operations[operation](payload)
            return {
                "statusCode": 200,
                "body": json.dumps(response, default=decimal_converter)  # Aplica conversão
            }
        else:
            return {
                "statusCode": 400,
                "body": json.dumps({"error": f'Unrecognized operation "{operation}"'})
            }
    except KeyError as e:
        return {
            "statusCode": 400,
            "body": json.dumps({"error": f"Missing key: {str(e)}"})
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }