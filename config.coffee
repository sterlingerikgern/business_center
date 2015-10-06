exports.config =
  # See docs at https://github.com/brunch/brunch/blob/stable/docs/config.md.
  conventions:
    assets:  /^app\/assets\//
    ignored: /^(bower_components\/bootstrap-less(-themes)?|app\/css\/overrides|(.*?\/)?[_]\w*)/
  modules:
    definition: false
    wrapper: false
  paths:
    public: '_public'
  files:
    javascripts:
      joinTo:
        'js/app.js': /^app/
        'js/vendor.js': /^(bower_components|vendor)/

    stylesheets:
      joinTo:
        'css/app.css': /^(app|vendor|bower_components)/
      order:
        before: [
          'app/css/app.less'
        ]

    templates: 
      joinTo:
        'js/templates.js' : /^app/ 

  plugins:
    angular_templates:
  	   path_transform: (path) -> path.replace('app/partials/', 'partials/')
    
  # Enable or disable minifying of result js / css files.
   minify: true
