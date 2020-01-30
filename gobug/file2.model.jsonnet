local test = import 'common.jsonnet';

{
  name: 'test2',
  sql: 'select ' + test.value,
}
