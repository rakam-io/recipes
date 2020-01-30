local test = import 'common.jsonnet';
local common = import 'inside/common1.jsonnet';

{
  name: 'test1',
  sql: 'select ' + test.value,
  label: common.who,
}
