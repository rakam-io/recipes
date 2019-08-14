local generate_jinja_header(obj) = std.join('', ['{%% set %s = %s %%} ' % [f, std.manifestPython(obj[f])] for f in std.objectFields(obj)]);
