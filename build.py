import _jsonnet
import json
import sys
from gcloud import storage
from oauth2client.service_account import ServiceAccountCredentials
import os


if __name__ == "__main__":
    result = []
    for root, dirs, files in os.walk("."):
        for name in files:
            if name == '_config.jsonnet':
                path = os.path.join(root, name)
                try:
                    config = json.loads(_jsonnet.evaluate_file(path))
                except Exception as e:
                    raise Exception("Unable to parse "+path+": "+str(e))
                result.append(
                    {"repository": 'https://github.com/rakam-io/recipes',
                     "path": root[1:],
                     "config": config
                     })

    if len(sys.argv) == 2 and sys.argv[1] == 'deploy':
        credentials_dict = {
            'type': 'service_account',
            'client_id': os.environ['CLIENT_ID'],
            'client_email': os.environ['CLIENT_EMAIL'],
            'private_key_id': os.environ['PRIVATE_KEY_ID'],
            'private_key': os.environ['PRIVATE_KEY'],
        }
        print("Deploying to "+json.dumps(credentials_dict))
        credentials = ServiceAccountCredentials.from_json_keyfile_dict(credentials_dict)
        client = storage.Client(credentials=credentials, project= os.environ['PROJECT_ID'])
        bucket = client.get_bucket('rakam-public')
        blob = bucket.blob('rakam-recipes.index.json')
        blob.upload_from_string(json.dumps(result), "application/json")
        blob.make_public()
        print("Successfully updated!")
