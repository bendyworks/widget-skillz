import Ember from 'ember';

export default Ember.View.extend({
  templateName: 'widget',
  widget: (() => this.content).property(),
  dragstop: function(){
    if(!this.get('controller.isNewWidget')){
      var model = this.get('controller.model');
      var newX = parseInt( this.$('.widget').css('left') );
      var newY = parseInt( this.$('.widget').css('top') );
      model.set('locationX', newX);
      model.set('locationY', newY);
      model.save();
    }
  },
  resizestop: function(){
    if(!this.get('controller.isNewWidget')){
      var model = this.get('controller.model');
      var newWidth = parseInt( this.$('.widget').css('width') );
      var newHeight = parseInt( this.$('.widget').css('height') );
      model.set('height', newHeight);
      model.set('width', newWidth);
      model.save();
    }
  },
  didInsertElement: function() {
    this.$('.widget')
      .draggable({ grid: [ 80, 80 ] })
      .resizable({ grid: [ 80, 80 ] });
  }
});
