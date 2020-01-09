# Recipes

[![Slack Channel](https://slackin-extended-eqlkwws8i.now.sh/badge.svg)](https://slackin-extended-eqlkwws8i.now.sh/)
[![wercker status](https://app.wercker.com/status/30b51613b0945eb6ca35bd51a8b2f84f/s/master "wercker status")](https://app.wercker.com/project/byKey/30b51613b0945eb6ca35bd51a8b2f84f)

A collection of Rakam recipes

## Converting JSON Dump to Recipe
You can convert the JSON dump that you exported from Rakam using the following command:

`python convert-rakam-export.py -f output.json -d ./`

`-d` where you want all the jsonnet files

`-f` the location of the JSON dump
