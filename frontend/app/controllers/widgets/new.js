import Ember from 'ember';
import DS from 'ember-data';

export default Ember.Controller.extend({
  needs: ['application'],
  availableTemplates: function(){
    var templatePromise = this.store.find('widgetTemplate').then(function(templateArray){
      return _.map(templateArray.content, function(template){
        return {title: template.get('title'), id: template.get('id')};
      });
    });

    return DS.PromiseArray.create({
      promise: templatePromise
    });
  }.property(),

  actions: {
    createWidget: function(){
      var newWidgetOptions = {
        locationX: 0,
        locationY: 0,
        width: 250,
        height: 200,
        widgetTemplate: this.store.find('widgetTemplate', this.get('newWidgetTemplate'))
      };

      this.store.createRecord('widget', newWidgetOptions);
      this.transitionTo('widgets');
    }
  }
});
