import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    saveWidget: function(widget){
      widget.save();
    }
  }
});
