import _jsonnet
import json
import os
import requests
import sys
from gcloud import storage
from oauth2client.service_account import ServiceAccountCredentials
import os

GITHUB_API_URL = "https://api.github.com/gists/3261da605c91ed76844e431391b6b91a"

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
            'client_id': os.environ['BACKUP_CLIENT_ID'],
            'client_email': os.environ['BACKUP_CLIENT_EMAIL'],
            'private_key_id': os.environ['BACKUP_PRIVATE_KEY_ID'],
            'private_key': os.environ['BACKUP_PRIVATE_KEY'],
        }
        credentials = ServiceAccountCredentials.from.from_json_keyfile_dict(
            credentials_dict
        )
        client = storage.Client(credentials=credentials, project='rakamui-215316')
        bucket = client.get_bucket('rakam-public')
        blob = bucket.blob(json.dumps(result))
        blob.upload_from_filename('rakam-recipes.index.json')


        import os
            res = requests.post(GITHUB_API_URL, headers={'Authorization': 'token %s' % os.environ['GITHUB_API_TOKEN']},
                                params={'scope': 'gist'},
                                data=json.dumps({"files": {"rakam-recipes.index.json": {"content": json.dumps(result)}}}))
            if res.status_code != 200:
                raise Exception(result.content)
            else:
                print("Successfully updated!")
