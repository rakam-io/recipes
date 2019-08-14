{
  generate_jinja_header(obj)::
    std.join('', ['{%% set %s = %s %%} ' % [f, std.manifestPython(obj[f])] for f in std.objectFields(obj)]),
  extractModelNameFromFileName(name)::
    std.strReplace(name, '.model.jsonnet', ''),
  generate_target_reference(target)::
    std.join(".", std.filter(function(x) x != null, [target.database, target.schema, target.table]))
}