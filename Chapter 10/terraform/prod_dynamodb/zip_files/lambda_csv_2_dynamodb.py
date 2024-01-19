import json, boto3, csv

region = 'us-east-1'

def lambda_handler(event, context):
    
    try:
        s3 = boto3.client('s3')        
        db = boto3.client('dynamodb', region_name = region)

# Get the uploaded file details
        bucketName = event['Records'][0]['s3']['bucket']['name'] 

        fileName = event['Records'][0]['s3']['object']['key']  

        print('Uploaded file name: ', fileName)
        
# Fetch the data from uploaded file        
        csvFile = s3.get_object(Bucket = bucketName, Key = fileName)  

        dataSet = csvFile['Body'].read().decode('utf-8').split('\n')  

        csvReader = csv.reader(dataSet, delimiter = ',', quotechar = '"')
        
        rows = 0
        
        for row in csvReader:
            rows += 1
            id = row[0]
            firstName = row[1]
            lastName = row[2]
            contact = row[3]

# Insert record in DynamoDB table
            response = db.put_item(TableName = 'Customers',
                Item = {
                    'Id': {
                        'N': str(id)
                    },
                    'Firstname': {
                        'S': str(firstName)
                    },
                    'Lastname': {
                        'S': str(lastName)
                    },
                    'Contact': {
                        'N': str(contact)
                    },
                })
            
        print('Successfully added ', rows, ' in Customers Table')        
        
    except Exception as e:
        print(str(e))
    
    return {
        'statusCode': 200,
        'body': json.dumps('Function execution completed!')
    }
