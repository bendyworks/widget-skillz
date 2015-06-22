import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  body: DS.attr('string'),
  locationX: DS.attr('number'),
  locationY: DS.attr('number'),
  width: DS.attr('number'),
  height: DS.attr('number')
});
