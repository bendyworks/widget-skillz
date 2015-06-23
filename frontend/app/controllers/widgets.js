import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    saveWidget: function(widget){
      console.log(arguments, this);
      widget.save();
    }
  }
});
