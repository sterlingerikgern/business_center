'use strict';

/* Filters */
angular.module('app.filters')
.filter('navFilter1', [
  'version', function(version) {
    return function(text) {
      return String(text).replace(/\%VERSION\%/mg, version);
    };
  }
]);