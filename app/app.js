'use strict';
var App;

App = angular.module('app', ['ngCookies', 'ngResource', 'ngRoute', 'app.controllers', 'app.directives', 'app.filters', 'app.services', 'templates', 'ui.bootstrap']);

App.config([
  '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider, config) {
    $routeProvider.when('/dashboard', {
      templateUrl: 'partials/dashboard/merchant.html'
    }).when('/dashboard/ar', {
      templateUrl: 'partials/dashboard/ar.html'
    }).when('/view1', {
      templateUrl: 'partials/1/partial1.html'
    }).when('/view2', {
      templateUrl: 'partials/2/partial2.html'
    }).otherwise({
      redirectTo: '/dashboard'
    });
    return $locationProvider.html5Mode(false);
  }
]);


angular.module('app.services', 		[]);
angular.module('app.filters', 		[]);
angular.module('app.controllers',   []);
angular.module('app.directives',  	['app.services', 'app.controllers']);