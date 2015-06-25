import Ember from 'ember';

export default Ember.Controller.extend({
  templateFieldList: function(){
    var model = this.model;
    return _.map(model.get('templateFields'), function(value, key){
      return {key: key,
              value: value,
              domID: 'widget_' + model.get('id') + '_' + key};
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
