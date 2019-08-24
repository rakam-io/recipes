import _jsonnet
import json
import os
import requests
import sys

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

    if sys.argv[1] == 'deploy':
            res = requests.post(GITHUB_API_URL, headers={'Authorization': 'token %s' % os.environ['GITHUB_API_TOKEN']},
                                params={'scope': 'gist'},
                                data=json.dumps({"files": {"rakam-recipes.index.json": {"content": json.dumps(result)}}}))
            if res.status_code != 200:
                raise Exception(result.content)
            else:
                print("Successfully updated!")
