Package.describe({
  name: 'mplatts:meteor-loader',
  version: '0.0.1',
  summary: 'Shows a progress bar while subscriptions load. Loader used: http://ricostacruz.com/nprogress',
  git: '',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.2');
  api.use('coffeescript');

  api.addFiles([
    'nprogress.js',
    'nprogress.css',
    'meteor-loader.coffee'
  ], 'client');
});
