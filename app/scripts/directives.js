'use strict';


/* Directives */
angular.module('app.directives', ['app.services', 'app.controllers'])
.directive('appVersion', [
  'version', function(version) {
    return function(scope, elm, attrs) {
      return elm.text(version);
    };
  }
]).directive('navTabs', function() {
  return {
    restrict: 'EA',
    templateUrl: 'partials/navTabs.html',
    controller: 'navTabsCtrl',
    controllerAs: 'tabs'
  };
}).directive('navSub', function() {
  return {
    restrict: 'EA',
    templateUrl: 'partials/navSub.html',
    controller: 'navSubCtrl',
    controllerAs: 'sub'
  };
});
   
