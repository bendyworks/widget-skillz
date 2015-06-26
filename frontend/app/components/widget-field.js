import Ember from 'ember';

export default Ember.Component.extend({
  layoutName: function() {
    var fieldType = this.get('field.type');

    // HACK: sometimes field.type is undefined, not sure
    // why yet :(
    if(fieldType){
      return 'components/' + fieldType + '-field';
    }
    else{
      return 'components/text-field';
    }
  }.property(),

  actions: {
    saveField: function(field){
      this.sendAction('action', field);
    }
  }
});
