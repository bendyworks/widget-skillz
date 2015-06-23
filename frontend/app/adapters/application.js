import DS from 'ember-data';
import $ from 'jquery';

export default DS.ActiveModelAdapter.extend({
  namespace: '/api',
  headers: {
    "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
  }
});
