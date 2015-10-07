'use strict';


/* Directives */
angular.module('app.directives')
.directive('navTabs', function() {
  return {
    restrict: 'EA',
    templateUrl: 'partials/nav/navTabs.html',
    controller: 'navTabsCtrl',
    controllerAs: 'tabs'
  };
}).directive('navSub', function() {
  return {
    restrict: 'EA',
    templateUrl: 'partials/nav/navSub.html',
    controller: 'navSubCtrl',
    controllerAs: 'sub'
  };
});
   
