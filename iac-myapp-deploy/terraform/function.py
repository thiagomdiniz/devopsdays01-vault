import json
import os
from hvac import Client

def lambda_handler(event, context):
    vault_url = os.getenv('VAULT_ADDR')
    role_name = os.getenv('VAULT_ROLE_NAME')

    client = Client(url=vault_url)
    client.token = os.getenv('VAULT_TOKEN')

    # Generate wrapped Secret ID
    # response = client.write(f'auth/approle/role/{role_name}/secret-id', wrap_ttl='10m')
    efs_path = os.getenv("EFS_PATH", "/mnt/efs")
    with open(f"{efs_path}/test.txt", "w") as f:
        f.write("Hello from Lambda with EFS!")
    return {"statusCode": 200, "body": "File written to EFS"}
    # return {
    #     'statusCode': 200,
    #     'body': json.dumps({
    #         'wrapped_token': response['wrap_info']['token']
    #     })
    # }
