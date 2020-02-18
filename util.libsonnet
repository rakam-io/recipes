{
  generate_jinja_header(obj)::
    std.join('', ['{%% set %s = %s %%} ' % [f, std.manifestPython(obj[f])] for f in std.objectFields(obj)]),
  generate_model_name_from_file(name)::
    local parts = std.split(name, '/');
    std.strReplace(parts[std.length(parts) - 1], '.model.jsonnet', ''),
  generate_target_reference(target)::
    local alias_quote = std.extVar('_aq');
    std.join('.', std.map(function(x) alias_quote + x + alias_quote, std.filter(function(x) x != null, [
      if std.objectHas(target, 'database') then target.database else null,
      if std.objectHas(target, 'schema') then target.schema else null,
      target.table,
    ]))),
}
