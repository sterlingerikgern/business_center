'use strict';


/* Directives */
angular.module('app.directives')
.directive('navTabs', function() {
  return {
    restrict: 'EA',
    templateUrl: 'partials/nav/tabs.html',
    controller: 'navTabsCtrl',
    controllerAs: 'tabs'
  };
}).directive('navHierarchy', function() {
  return {
    restrict: 'EA',
    templateUrl: 'partials/nav/hierarchy.html',
    controller: 'navHierarchyCtrl',
    controllerAs: 'hierarchy'
  };
}).directive('navDateRange', function() {
  return {
    restrict: 'EA',
    templateUrl: 'partials/nav/daterange.html'
  };
});
   
