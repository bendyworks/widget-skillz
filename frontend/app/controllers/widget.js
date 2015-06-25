import Ember from 'ember';

export default Ember.Controller.extend({
  templateFieldList: function(){
    return _.map(this.model.get('templateFields'), function(value, key){
      return {key: key, value: value};
    });
  }.property('templateFields')
});
