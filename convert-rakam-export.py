import json
from argparse import ArgumentParser
from slugify import slugify

parser = ArgumentParser()
parser.add_argument("-f", "--file", dest="filename",
                    help="Rakam Dump File (JSON)", metavar="FILE")
parser.add_argument("-d", "--output", dest="output",
                    help="Dump Files to directory", metavar="DIRECTORY")
args = parser.parse_args()

all_data = json.loads(open(args.filename, "r").read())
# for model in all_data.get('models'):
#     model_file = open(args.output+slugify(model.get('name'), max_length=20, word_boundary=True, separator="_")+".model.jsonnet", "w+")
#     model_file.write(json.dumps(model, indent=4))
#     model_file.close()
#
# for dashboard in all_data.get('dashboards'):
#     dashboard_file = open(args.output+slugify(dashboard.get('name'), max_length=20, word_boundary=True, separator="_") + ".dashboard.jsonnet", "w+")
#     dashboard_file.write(json.dumps(dashboard, indent=4))
#     dashboard_file.close()

config_file = open(args.output+'_config.jsonnet', "w+")
config_file.write(json.dumps({"version": all_data.get('version'), "label": all_data.get('label'), "description": '', "tags": [], "databases": None}, indent=4))
config_file.close()

print('Done!')
