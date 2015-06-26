import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  widgets: DS.hasMany('widget', {async: true}),
  fields: DS.attr()
});
