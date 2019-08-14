import _jsonnet


if __name__ == "__main__":
    result = []
    for root, dirs, files in os.walk(path):
        if name in files:
            result.append(os.path.join(root, name))
    return result


json_str = _jsonnet.evaluate_snippet(
    "snippet", jsonnet_str,
    ext_vars={'OTHER_NAME': 'Bob'})