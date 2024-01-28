import boto3
import json

def lambda_handler(event, context):
    # Check if the request is a POST request with form data
    if event['httpMethod'] == 'POST' and event['body']:
        # Parse the form data from the event object
        form_data = json.loads(event['body'])

        # Create a DynamoDB client
        dynamodb = boto3.resource('dynamodb')
        table = dynamodb.Table('UserInfoTable')

        # Prepare the item data
        item = {
            'UserId': form_data.get('UserId'),
            'Name': form_data.get('Name'),
            'Email': form_data.get('Email'),
            'Phone': form_data.get('Phone')
        }

        # Store the item in DynamoDB
        table.put_item(Item=item)

        # Return a success response
        response = {
            'statusCode': 200,
            'body': json.dumps('User information stored successfully!')
        }
        return response
    else:
        # If not a POST request, return the HTML form
        html = '''
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>User Information Form</title>
        </head>
        <body>
            <form id="user-info-form">
                <label for="UserId">User ID:</label><br>
                <input type="text" id="UserId" name="UserId" required><br>
                <label for="Name">Name:</label><br>
                <input type="text" id="Name" name="Name" required><br>
                <label for="Email">Email:</label><br>
                <input type="email" id="Email" name="Email" required><br>
                <label for="Phone">Phone:</label><br>
                <input type="text" id="Phone" name="Phone" required><br>
                <button type="button" onclick="submitForm()">Submit</button>
            </form>

            <script>
                function submitForm() {
                    var userId = document.getElementById('UserId').value;
                    var name = document.getElementById('Name').value;
                    var email = document.getElementById('Email').value;
                    var phone = document.getElementById('Phone').value;

                    var formData = {
                        UserId: userId,
                        Name: name,
                        Email: email,
                        Phone: phone
                    };
                    
                    fetch('https://your-api-gateway-url', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(formData)
                    })
                    .then(response => response.json())
                    .then(data => alert(data))
                    .catch(error => console.error('Error:', error));
                }
            </script>
        </body>
        </html>
        '''
        return {
            'statusCode': 200,
            'headers': { 'Content-Type': 'text/html' },
            'body': html
        }
