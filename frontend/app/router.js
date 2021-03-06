import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('widgets');
  this.route('widgets/new');

  this.route('widgetTemplates', function() {
    this.route('new');
  });
});

export default Router;
