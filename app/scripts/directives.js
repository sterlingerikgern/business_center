'use strict';


/* Directives */
angular.module('app.directives')
.directive('appVersion', ['appVersion', function(v) {
    return function(scope, elm, attrs) {
      return elm.text(v);
    };
  }
]);
   
