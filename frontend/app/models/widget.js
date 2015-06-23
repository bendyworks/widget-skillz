import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  body: DS.attr('string'),
  locationX: DS.attr('number'),
  locationY: DS.attr('number'),
  width: DS.attr('number'),
  height: DS.attr('number'),
  style: function() {
    return "top: " + this.get('locationY') + "px; left: " + this.get('locationX') +
           "px; height: " + this.get('height') + "px; width: " +
           this.get('width') + "px; border: 1px solid; position: absolute; overflow: hidden;";
  }.property('width', 'height', 'locationY', 'locationX')
});