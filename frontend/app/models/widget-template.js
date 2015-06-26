import DS from 'ember-data';

export default DS.Model.extend({
  widgets: DS.hasMany('widget', {async: true}),
  fields: DS.attr()
});
