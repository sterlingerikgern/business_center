'use strict';

/* Controllers */
angular.module('app.controllers')
.controller('navHierarchyCtrl', [
  '$scope', function($scope) {
    return $scope;
  }
]).controller('navTabsCtrl', ['$scope', '$http', '$log', function ($scope, $http, $log) {
    $scope.activeTab = '';
    
	$http.get('/routes.json').success(function (data) {
		$scope.tabs = data;
	});	
	
    $scope.setTab = function(selectedTab){
    	$scope.activeTab = selectedTab;
    	console.log(selectedTab);
    }				 

}]
);