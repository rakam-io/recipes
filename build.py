import _jsonnet
import json
import sys
from gcloud import storage
from oauth2client.service_account import ServiceAccountCredentials
import os

example_values = {
    'model': 'model',
    'schema': {"database": "database", "schema": "schema"},
    'string': 'value',
    'table': {"database": "database", "schema": "schema", "table": "table"},
    'multiple-table': {"database": "database", "schema": "schema", "table": ["table1", "table2"]},
    'target': {"database": "database", "schema": "schema", "table": "table"},
    'table-multiple-column': {"column": {"type": "string", "column": "column"}},
    "table-column": {"column": {"type": "string", "column": "column"}},
    "numeric": 1,
    "sql": [],
    'boolean': True,
    'model-mapping': {}
}

if __name__ == "__main__":
    result = []
    extended_result = []
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
                variableValues = {}
                if "variables" in config:
                    for variable_name, variable_value in config.get("variables").items():
                        example_value = example_values[variable_value.get('type')]
                        variableValues[variable_name] = json.dumps(example_value)
                recipe_models = []
                recipe_dashboards = []
                for root_recipe, _, recipe_files in os.walk(root):
                    for recipe_file in recipe_files:
                        is_model = recipe_file.endswith(".model.jsonnet")
                        is_models = recipe_file.endswith(".models.jsonnet")
                        is_dashboard = recipe_file.endswith(".dashboard.jsonnet")
                        recipe_file_path = os.path.join(root_recipe, recipe_file)
                        if is_model or is_models or is_dashboard:
                            try:
                                data = _jsonnet.evaluate_file(recipe_file_path, ext_codes=variableValues)
                            except Exception as e:
                                raise Exception("Unable to parse "+recipe_file_path+": "+e)
                            if is_model: recipe_models.append(json.loads(data))
                            if is_models: recipe_models += json.loads(data)
                            if is_dashboard: recipe_dashboards.append(json.loads(data))
                extended_result.append({"repository": 'https://github.com/rakam-io/recipes',
                     "path": root[1:], "config": config, "models": recipe_models, "dashboards": recipe_dashboards})

    if len(sys.argv) == 2 and sys.argv[1] == 'deploy':
        credentials_dict = {
            'type': 'service_account',
            'client_id': os.environ['CLIENT_ID'],
            'client_email': os.environ['CLIENT_EMAIL'],
            'private_key_id': os.environ['PRIVATE_KEY_ID'],
            'private_key': os.environ['PRIVATE_KEY'].replace('\\n', '\n'),
        }

        credentials = ServiceAccountCredentials.from_json_keyfile_dict(credentials_dict)
        client = storage.Client(credentials=credentials, project= os.environ['PROJECT_ID'])
        bucket = client.get_bucket('rakam-public')
        bucket.blob('rakam-recipes.index.json').upload_from_string(json.dumps(result), "application/json")
        bucket.blob('rakam-recipes-extended.index.json').upload_from_string(json.dumps(extended_result), "application/json")
        print("Successfully updated!")
