import { moduleForModel, test } from 'ember-qunit';

moduleForModel('widget', 'Unit | Model | widget', {
  // Specify the other units that are required for this test.
  needs: ['model:widgetTemplate']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
