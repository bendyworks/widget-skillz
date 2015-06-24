import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from 'frontend/tests/helpers/start-app';

var application;

module('Acceptance | widgets', {
  beforeEach: function() {
    application = startApp();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});

test('visiting /widgets', function(assert) {
  visit('/widgets');

  andThen(function() {
    assert.equal($('.widget').length, 2);
    assert.equal($('.widget:contains("a widget")').length, 1);
    assert.equal(currentPath(), 'widgets');
  });
});
