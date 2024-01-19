import json, boto3

region = 'us-east-1'

def lambda_handler(event, context):
    try:
        statusCode = 200
        result = None
        
        db = boto3.client('dynamodb', region_name = region)

        httpMethod = event['httpMethod']

        body = {}
        params = {}
        
        if 'body' in event.keys() and event['body']:
            body = json.loads(event['body'])
        if 'queryStringParameters' in event.keys():
            params = event['queryStringParameters']
        
# Read an item by id
        if httpMethod == 'GET':
            if 'id' not in params.keys():
                statusCode = 400
                result = 'Id parameter not specified in query string'
            else:
                id = params['id']
                response = db.get_item(
                    Key={
                        'Id': {
                            'N': str(id)
                        }
                    },
                    TableName = 'Customers')
                result = response['Item']

# Create item
        elif httpMethod == 'POST':
            if body.keys() < {'id', 'firstname', 'lastname', 'contact'}:
                statusCode = 400
                result = 'Ensure that id, firstname, lastname, contact are present in the request body'            
            else:
                id = body['id']
                firstname = body['firstname']
                lastname = body['lastname']
                contact = body['contact']
                result = db.put_item(
                    Item={
                        'Id': {
                            'N': str(id)
                        },
                        'Firstname': {
                            'S': str(firstname)
                        },
                        'Lastname': {
                            'S': str(lastname)
                        },
                        'Contact': {
                            'N': str(contact)
                        },
                    },
                    TableName = 'Customers')
                result = 'Item created successfully'

        
        
# Update item, this will create new item if the key does not exist
        elif httpMethod == 'PUT':
            if body.keys() < {'id', 'firstname', 'lastname', 'contact'}:
                statusCode = 400
                result = 'Ensure that id, firstname, lastname, contact are present in the request body'                
            else:
                id = body['id']
                firstname = body['firstname']
                lastname = body['lastname']
                contact = body['contact']
                db.put_item(
                    Item={
                        'Id': {
                            'N': str(id)
                        },
                        'Firstname': {
                            'S': str(firstname)
                        },
                        'Lastname': {
                            'S': str(lastname)
                        },
                        'Contact': {
                            'N': str(contact)
                        },
                    },
                    TableName = 'Customers')
                result = 'Item updated successfully'

# Delete an item by id
        elif httpMethod == 'DELETE':
            if 'id' not in params.keys():
                statusCode = 400
                result = 'Id parameter not specified in query string'              
            else:
                id = params['id']
                db.delete_item(
                    Key={
                        'Id': {
                            'N': str(id)
                        }
                    },
                    TableName = 'Customers')
                result = 'Item deleted successfully'

    except Exception as ex:
        statusCode = 500
        result = str(ex)
    
    return {
        'statusCode': statusCode,
        'body': json.dumps(result)
    }
