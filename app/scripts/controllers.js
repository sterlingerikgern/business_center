'use strict';

/* Controllers */
angular.module('app.controllers', []).controller('AppCtrl', [
  '$scope', '$location', '$resource', '$rootScope', function($scope, $location, $resource, $rootScope) {
    $scope.$location = $location;
    $scope.$watch('$location.path()', function(path) {
      return $scope.activeNavId = path || '/';
    });
    return $scope.getClass = function(id) {
      if ($scope.activeNavId.substring(0, id.length) === id) {
        return 'active';
      } else {
        return '';
      }
    };
  }
]).controller('navSubCtrl', [
  '$scope', function($scope) {
    return $scope;
  }
]).controller('MyCtrl2', [
  '$scope', function($scope) {
    return $scope;
  }
]).controller('MyCtrl2', [
  '$scope', function($scope) {
    return $scope;
  }
])
.controller('navTabsCtrl', ['$scope', function ($scope) {
    $scope.activeTab = '';
    $scope.tabs = [
    				{
    				 'display': 'Dashboard',
    				 'icon': 'fa-dashboard',
    				 'url': 'partials/merchant-dashboard.html'
    				 },{
    				 'display': 'Statements',
    				 'icon': 'fa-align-justify',
    				 'url': 'partials/merchant-dashboard.html'
    				 },{
    				 'display': 'Processing',
    				 'icon': 'fa-bar-chart-o',
    				 'url': 'partials/merchant-dashboard.html'
    				 },{
    				 'display': 'Disputes',
    				 'icon': 'fa-flag',
    				 'url': 'partials/merchant-dashboard.html'
    				 },{
    				 'display': 'Programs',
    				 'icon': 'fa-sliders',
    				 'url': 'partials/merchant-dashboard.html'
    				 },{
    				 'display': 'Resources',
    				 'icon': 'fa-tags',
    				 'url': 'partials/merchant-dashboard.html'
    				 },{
    				 'display': 'Help',
    				 'icon': 'fa-table',
    				 'url': 'partials/merchant-dashboard.html'
    				 }
    				 ];
    $scope.setTab = function(selectedTab){
    	$scope.activeTab = selectedTab;
    	console.log(selectedTab);
    }				 

}]
).controller('MainCtrl', ['$scope', function ($scope) {
    $scope.val = 'B';
    $scope.states = ['California', 'Arizona', 'Nevada', 'Florida'];
    $scope.slides = ['pic1.jpg', 'pic2.jpg', 'pic3.jpg'];

}]
).controller('TodoCtrl', [
  '$scope', function($scope) {
    $scope.todos = [
      {
        text: "learn angular",
        done: true
      }, {
        text: "build an angular app",
        done: false
      }
    ];
    $scope.addTodo = function() {
      $scope.todos.push({
        text: $scope.todoText,
        done: false
      });
      return $scope.todoText = "";
    };
    $scope.remaining = function() {
      var count;
      count = 0;
      angular.forEach($scope.todos, function(todo) {
        return count += (todo.done ? 0 : 1);
      });
      return count;
    };
    return $scope.archive = function() {
      var oldTodos;
      oldTodos = $scope.todos;
      $scope.todos = [];
      return angular.forEach(oldTodos, function(todo) {
        if (!todo.done) {
          return $scope.todos.push(todo);
        }
      });
    };
  }
]);