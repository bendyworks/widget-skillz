import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['application'],
  templateFields: [],
  availableFieldTypes: Ember.computed.alias('controllers.application.availableFieldTypes'),
  actions: {
    addField: function(){
      var newFields = {
        name: '',
        type: ''
      };
      this.set('templateFields', this.get('templateFields').concat(newFields));
    },
    createWidgetTemplate: function(){
      var controller = this;
      var mod = this.get('model');

      var modelFields = _.reduce(this.get('templateFields'), function(fieldList, field){
        if(field.type !== ''){
          fieldList[field.name] = field.type;
        }
        return fieldList;
      }, {});

      mod.set('fields', modelFields);

      mod.save().then(function(){
        controller.set('templateFields', []);
        controller.transitionTo('widgets');
      }, function(error){
        alert('error saving template (see console)');
        console.log(error);
      });
    }
  }
});
