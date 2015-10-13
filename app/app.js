'use strict';

var $routeProviderReference;

angular.module('app', ['ngCookies', 'ngResource', 'ngRoute', 'app.controllers', 'app.directives', 'app.filters', 'app.services', 'templates', 'ui.bootstrap','nya.bootstrap.select','daterangepicker', 'ng-fusioncharts'])
.config(['$routeProvider', function($routeProvider) {
  $routeProviderReference = $routeProvider;
}]);

angular
.module('app')
.run(['$rootScope', '$http', '$route', '$log', function($rootScope, $http, $route, $log) {
    //getting routes
   
    $http.get('/routes.json').success(function (data) {
		//$log.debug(data);
		angular.forEach(data, function (route) {
			$routeProviderReference.when( route.url, { templateUrl: route.template } );
			 //$log.debug('Individual ROUTE');
			 //$log.debug(route);
			angular.forEach(route.menuItems, function (route1) {
				$routeProviderReference.when( route1.url, { templateUrl: route1.template } );
				
				//$log.debug(route1);
				angular.forEach(route1.menuItems, function (route2) {
					$routeProviderReference.when( route2.url, { templateUrl: route2.template } );
					//$log.debug(route2);
				});
			
			});
		
		
		});
		$routeProviderReference.otherwise({ redirectTo: '/dashboard/merchant' });
		$route.reload();
	});

}]);



angular.module('app.services', 		[]);
angular.module('app.filters', 		[]);
angular.module('app.controllers',   []);
angular.module('app.directives',  	['app.services', 'app.controllers']);

