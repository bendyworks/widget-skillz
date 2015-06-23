import Ember from 'ember';

export default Ember.View.extend({
  templateName: 'widget',
  widget: (() => this.content).property(),
  didInsertElement: function() {
    this.$('.widget').draggable({ grid: [ 80, 80 ] });
  }
});
