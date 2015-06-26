import Ember from 'ember';
import DS from 'ember-data';

export default Ember.Controller.extend({
  templateFieldList: function(){
    var model = this.model;
    var promise = model.get('widgetTemplate').then(function(template) {
      return _.map(model.get('templateFields'), function(value, key){
        return {key: key,
                type: template.get('fields')[key],
                value: value,
                domID: 'widget_' + model.get('id') + '_' + key};
      });
    });
    return DS.PromiseArray.create({
      promise: promise
    });
  }.property('templateFields'),

  actions: {
    saveField: function(field) {
      var newVal = $('#' + field.domID).val();
      var fields = this.model.get('templateFields');
      fields[field.key] = newVal;

      this.model.set('templateFields', fields);
      this.model.save();
    }
  }
});
