{
  generate_jinja_header(obj)::
    std.join('', ['{%% set %s = %s %%} ' % [f, std.manifestPython(obj[f])] for f in std.objectFields(obj)]),
  generate_model_name_from_file(name)::
    local parts = std.split(name, '/');
    std.strReplace(parts[std.length(parts) - 1], '.model.jsonnet', ''),
  generate_target_reference(target, aq={})::
    std.join('.', std.filter(function(x) x != null, [aq + target.database + aq, aq + target.schema + aq, aq + target.table + aq])),
}
