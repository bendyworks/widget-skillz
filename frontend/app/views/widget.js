import Ember from 'ember';

export default Ember.View.extend({
  templateName: 'widget',
  widget: (() => this.content).property(),
  dragstop: function(){
    var model = this.get('controller.model');
    var newX = parseInt( this.$('.widget').css('left') );
    var newY = parseInt( this.$('.widget').css('top') );
    model.set('locationX', newX);
    model.set('locationY', newY);
    model.save();
  },
  didInsertElement: function() {
    this.$('.widget')
      .draggable({ grid: [ 80, 80 ] })
      .resizable();
  }
});
