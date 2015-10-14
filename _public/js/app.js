'use strict';

var $routeProviderReference;

angular.module('app', ['ngCookies', 'ngResource', 'ngRoute', 'app.controllers', 'app.directives', 'app.filters', 'app.services', 'templates', 'ui.bootstrap','nya.bootstrap.select','daterangepicker', 'ng-fusioncharts', 'ui.grid', 'ui.grid.infiniteScroll'])
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


'use strict';

/* Controllers */
angular.module('app.controllers').controller('AppCtrl', [
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
])
.controller('TestCtrl', ['$scope', '$interval', function($scope, $interval) {
    $scope.date = {
        startDate: moment().subtract("days", 1),
        endDate: moment()
    };
 
}])
.controller('MainCtrl', ['$scope', function ($scope) {
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
'use strict';


/* Directives */
angular.module('app.directives')
.directive('appVersion', ['appVersion', function(v) {
    return function(scope, elm, attrs) {
      return elm.text(v);
    };
  }
]);
   

'use strict';

/* Filters */
angular.module('app.filters').filter('interpolate', [
  'version', function(version) {
    return function(text) {
      return String(text).replace(/\%VERSION\%/mg, version);
    };
  }
]);
'use strict';

/* Sevices */
angular.module('app.services').factory('appVersion', function() {
  return "0.4";
});
'use strict';

/* Controllers */


angular.module('app.controllers')
.controller('ad_space', function ($scope) {
	$scope.ad_img =  '/img/ad_funding_equipment_205_05.jpg';
});


angular.module('app.controllers')
.controller('status_boxes', function ($scope) {
	$scope.data = [
		{
			title: "Transactions",
			icon: "fa-credit-card",
			largeText: "12,132",
			subText: "^5.2%",
			linkUrl: "#/transactions",
			linkText: "View All Transcations"
		},
		{
			title: "Last Settlement",
			icon: "fa-money",
			largeText: "$37,807",
			subText: "^18.2%",
			linkUrl: "#/settlements",
			linkText: "View All Settlements"
		},
		{
			title: "Disputes",
			icon: "fa-flag",
			largeText: "0 New",
			subText: "",
			linkUrl: "#/disputes",
			linkText: "You have 2 pending disputes"
		},
		{
			title: "PCI Status",
			icon: "fa-flag",
			largeText: "Not compliant!",
			linkUrl: "#/pcistatus",
			linkText: "4 of 7 devices need attention",
			widgetClass: "mini-widget-grey"
		}
	]
});




angular.module('app.controllers')
.controller('merchantVolumeSummary', function ($scope) {
              $scope.datasource = {
                chart: {
					"numberPrefix": "$",
					"paletteColors": "#0075c2",
					"bgAlpha" : "50",
					"bgColor" : "f7f7f7",
					"showBorder": "0",
					"showCanvasBorder": "0",
					"usePlotGradientColor": "0",
					"plotBorderAlpha": "10",
					"placeValuesInside": "1",
					"valueFontColor": "#ffffff",
					"showAxisLines": "1",
					"axisLineAlpha": "25",
					"divLineAlpha": "10",
					"alignCaptionWithCanvas": "0",
					"showAlternateVGridColor": "0",
					"captionFontSize": "14",
					"subcaptionFontSize": "14",
					"subcaptionFontBold": "0",
					"toolTipColor": "#ffffff",
					"toolTipBorderThickness": "0",
					"toolTipBgColor": "#000000",
					"toolTipBgAlpha": "80",
					"toolTipBorderRadius": "2",
					"toolTipPadding": "5"
                },
                data:[{
                    label: "1/15",
                    value: "880000"
                },
                {
                    label: "2/15",
                    value: "730000"
                },
                {
                    label: "3/15",
                    value: "590000"
                },
                {
                    label: "4/15",
                    value: "520000"
                },
                {
                    label: "5/15",
                    value: "330000"
                }],
				"trendlines": [{
					"line": [{
						"startvalue": "630000",
						"color": "#1aaf5d",
						"displayvalue": "Target"
					}]
				}]
              };
            });
            
            
angular.module('app.controllers')
.controller('merchantVolumeByType', function ($scope) {
              $scope.datasource = {
					chart: {
						"palette": "2",
						"showvalues": "0",
						"formatnumberscale": "0",
						"showlegend": "0",
						"paletteColors": "#0075c2,#00c260",
						"bgAlpha" : "50",
						"bgColor" : "f7f7f7",
						"showBorder": "0",
						"showCanvasBorder": "0",
						"usePlotGradientColor": "0",
						"plotBorderAlpha": "10",
						"placeValuesInside": "1",
						"valueFontColor": "#ffffff",
						"showAxisLines": "1",
						"axisLineAlpha": "25",
						"divLineAlpha": "10",
						"alignCaptionWithCanvas": "0",
						"showAlternateVGridColor": "0",
						"captionFontSize": "14",
						"subcaptionFontSize": "14",
						"subcaptionFontBold": "0",
						"toolTipColor": "#ffffff",
						"toolTipBorderThickness": "0",
						"toolTipBgColor": "#000000",
						"toolTipBgAlpha": "80",
						"toolTipBorderRadius": "2",
						"toolTipPadding": "5"



					},
					"categories": [
						{
							"category": [
								{
									"label": "Jan"
								},
								{
									"label": "Feb"
								},
								{
									"label": "Mar"
								},
								{
									"label": "Apr"
								},
								{
									"label": "May"
								}
							]
						}
					],
					"dataset": [
						{
							"seriesname": "Revenue",
							"data": [
								{
									"value": "5854"
								},
								{
									"value": "4171"
								},
								{
									"value": "1375"
								},
								{
									"value": "1875"
								},
								{
									"value": "2246"
								}
							]
						},
						{
							"seriesname": "Profit",
							"renderAs": "Line",
							"data": [
								{
									"value": "3242"
								},
								{
									"value": "3171"
								},
								{
									"value": "700"
								},
								{
									"value": "1287"
								},
								{
									"value": "1856"
								}
							]
						}
					]
				  };

			});
		
		
		
		
		
		
		
	/* Controllers */
angular.module('app.controllers')
.controller('merchantPieVolume', function ($scope) {	
		
		$scope.datasource = {
				chart: {
					startingangle: "0",
					showlabels: "1",
					showlegend: "0",
					enablemultislicing: "0",
					slicingdistance: "15",
					showpercentvalues: "0",
					showpercentintooltip: "0",
					theme: "fint",
					"bgAlpha" : "50",
					"bgColor" : "f7f7f7",
					"plotgradientcolor": "",
					"paletteColors": "#0075c2,#00c260,#03622c,#3f9c35",
					enableRotation: "1",
					pieYScale: "900",
					pieRadius: "80"
				},
				data: [
					{
						label: "Visa",
						value: "1250400"
					},
					{
						label: "Mastercard",
						value: "1463300"
					},
					{
						label: "Discover",
						value: "1050700"
					},
					{
						label: "Amex",
						value: "491000"
					}
				]
			};

});


angular.module('app.controllers')
.controller('merchantDepositHistory', function ($scope) {
		$scope.attrs = {
			"numberprefix": "$",
			"plotgradientcolor": "",
			"bgcolor": "FFFFFF",
			"showalternatehgridcolor": "0",
			"divlinecolor": "CCCCCC",
			"showvalues": "0",
			"showcanvasborder": "0",
			"canvasborderalpha": "0",
			"canvasbordercolor": "CCCCCC",
			"canvasborderthickness": "1",
			"yaxismaxvalue": "30000",
			"captionpadding": "30",
			"linethickness": "3",
			"yaxisvaluespadding": "15",
			"legendshadow": "1",
			"legendborderalpha": "0",
			"paletteColors": "#0075c2,#00c260",
			"showborder": "0",
			"bgAlpha" : "50",
			"bgColor" : "f7f7f7",
		};

		$scope.categories = [{
			"category": [{
				"label": "Jan"
			}, {
				"label": "Feb"
			}, {
				"label": "Mar"
			}, {
				"label": "Apr"
			}, {
				"label": "May"
			}, {
				"label": "Jun"
			}, {
				"label": "Jul"
			}, {
				"label": "Aug"
			}, {
				"label": "Sep"
			}, {
				"label": "Oct"
			}, {
				"label": "Nov"
			}, {
				"label": "Dec"
			}]
		}];

		$scope.dataset = [{
				"seriesname": "2013",
				"data": [{
					"value": "22400"
				}, {
					"value": "24800"
				}, {
					"value": "21800"
				}, {
					"value": "21800"
				}, {
					"value": "24600"
				}, {
					"value": "27600"
				}, {
					"value": "26800"
				}, {
					"value": "27700"
				}, {
					"value": "23700"
				}, {
					"value": "25900"
				}, {
					"value": "26800"
				}, {
					"value": "24800"
				}]
			},

			{
				"seriesname": "2012",
				"data": [{
					"value": "10000"
				}, {
					"value": "11500"
				}, {
					"value": "12500"
				}, {
					"value": "15000"
				}, {
					"value": "16000"
				}, {
					"value": "17600"
				}, {
					"value": "18800"
				}, {
					"value": "19700"
				}, {
					"value": "21700"
				}, {
					"value": "21900"
				}, {
					"value": "22900"
				}, {
					"value": "20800"
				}]
			}
		];
});







angular.module('app.controllers')
.controller('announcementCtrl', ['$scope', '$sce', function ($scope, $sce) {
		$scope.announcements = [
			{
				icon: 'fa-microphone',
				title: 'May 2015 Statement Now Posted to the Business Center',
				body: $sce.trustAsHtml('Your May 2015 Statement is now available under the Statements tab. We appreciate your business!'),
				image: '',
				url: '',
				color: 'warning',
			},{
				icon: 'fa-bullhorn',
				title: 'American Express Acceptance Agreement Now Online',
				body: $sce.trustAsHtml('Effective with the October 2014 mandates, American Express has made changes to the Card Acceptance Agreement (CAA). You may now view your updated American Express Acceptance Agreement online in Business Center\'s Document Center. Access the Document Center, select Document Search and enter keywords, One Point. For questions or more information, please contact Sterling\'s Merchant Services team at 800-383-0561 or via e-mail at merchant.services@sterlingpayment.com'),
				image: '',
				url: '',
				color: 'info',
			},{
				icon: 'fa-microphone',
				title: 'There is Still Time to Enroll',
				body: $sce.trustAsHtml('As your payment processor, Sterling Payment Technologies, LLC has partnered with MCAG, a class action settlement expert, to streamline the filing process and secure recoveries for our valued merchants from the "Visa®/MasterCard® Interchange Fee Class Action Settlement.” The lawsuit claims that merchants paid more fees than they should have for accepting Visa® and MasterCard® as payment from consumers during the period between January 1, 2004 and November 28, 2012. If your business accepted Visa® or MasterCard® credit or debit payments in the U.S. during this period of time, you may be eligible to recover funds from this approved $5+ billion Settlement. <br/><br/>There are no upfront or hidden fees. If no money is recovered on your behalf, then no money is owed to MCAG for this service. Act now, and enroll today in the MCAG Settlement Recovery Service. For additional information, class members may visit http://www.paymentcardsettlement.com/, the Court-approved website for this case.'),
				image: '',
				url: '',
				color: 'success',
			},{
				icon: 'fa-microphone',
				title: 'May 2015 Statement Now Posted to the Business Center',
				body: $sce.trustAsHtml('Your May 2015 Statement is now available under the Statements tab. We appreciate your business!'),
				image: '',
				url: '',
				color: 'warning',
			},{
				icon: 'fa-microphone',
				title: 'May 2015 Statement Now Posted to the Business Center',
				body: $sce.trustAsHtml('Your May 2015 Statement is now available under the Statements tab. We appreciate your business!'),
				image: '',
				url: '',
				color: 'warning',
			}
		];
}]);
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
'use strict';

/* Sevices */
angular.module('app.services').factory('myData', function() {
  return "John";
});
'use strict';

/* Controllers */


angular.module('app.controllers')
.controller('transactionsCtrl', ['$scope', '$http', '$timeout', '$q', function ($scope, $http, $timeout, $q) {



 $scope.filterPopover = {
    templateUrl: 'partials/transactions/filters.html',
    title: 'Advanced Filtering Options'
  };
  
  
  
 $scope.columnsPopover = {
    templateUrl: 'partials/transactions/columns.html',
    title: 'Show/Hide Columns'
  };
    
 $scope.summarizePopover = {
    templateUrl: 'partials/transactions/summarize.html',
    title: 'Sorts & Summarize By:'
  };

    
 $scope.exportPopover = {
    templateUrl: 'partials/transactions/export.html',
    title: 'Export Options'
  };
  
  
  
  $scope.gridOptions = {
    infiniteScrollRowsFromEnd: 40,
    infiniteScrollUp: true,
    infiniteScrollDown: true,
    columnDefs: [
      { name:'id'},
      { name:'name' },
      { name:'age' },
      { name:'address.city' },
      { name:'address.state' }
    ],
    data: 'data',
    onRegisterApi: function(gridApi){
      gridApi.infiniteScroll.on.needLoadMoreData($scope, $scope.getDataDown);
      gridApi.infiniteScroll.on.needLoadMoreDataTop($scope, $scope.getDataUp);
      $scope.gridApi = gridApi;
    }
  };
 
  $scope.data = [];
 
  $scope.firstPage = 2;
  $scope.lastPage = 2;
 
  $scope.getFirstData = function() {
    var promise = $q.defer();
    $http.get('10000_complex.json')
    .success(function(data) {
      var newData = $scope.getPage(data, $scope.lastPage);
      $scope.data = $scope.data.concat(newData);
      promise.resolve();
    });
    return promise.promise;
  };
 
  $scope.getDataDown = function() {
    var promise = $q.defer();
    $http.get('10000_complex.json')
    .success(function(data) {
      $scope.lastPage++;
      var newData = $scope.getPage(data, $scope.lastPage);
      $scope.gridApi.infiniteScroll.saveScrollPercentage();
      $scope.data = $scope.data.concat(newData);
      $scope.gridApi.infiniteScroll.dataLoaded($scope.firstPage > 0, $scope.lastPage < 4).then(function() {$scope.checkDataLength('up');}).then(function() {
        promise.resolve();
      });
    })
    .error(function(error) {
      $scope.gridApi.infiniteScroll.dataLoaded();
      promise.reject();
    });
    return promise.promise;
  };
 
  $scope.getDataUp = function() {
    var promise = $q.defer();
    $http.get('10000_complex.json')
    .success(function(data) {
      $scope.firstPage--;
      var newData = $scope.getPage(data, $scope.firstPage);
      $scope.gridApi.infiniteScroll.saveScrollPercentage();
      $scope.data = newData.concat($scope.data);
      $scope.gridApi.infiniteScroll.dataLoaded($scope.firstPage > 0, $scope.lastPage < 4).then(function() {$scope.checkDataLength('down');}).then(function() {
        promise.resolve();
      });
    })
    .error(function(error) {
      $scope.gridApi.infiniteScroll.dataLoaded();
      promise.reject();
    });
    return promise.promise;
  };
 
 
  $scope.getPage = function(data, page) {
    var res = [];
    for (var i = (page * 100); i < (page + 1) * 100 && i < data.length; ++i) {
      res.push(data[i]);
    }
    return res;
  };
 
  $scope.checkDataLength = function( discardDirection) {
    // work out whether we need to discard a page, if so discard from the direction passed in
    if( $scope.lastPage - $scope.firstPage > 3 ){
      // we want to remove a page
      $scope.gridApi.infiniteScroll.saveScrollPercentage();
 
      if( discardDirection === 'up' ){
        $scope.data = $scope.data.slice(100);
        $scope.firstPage++;
        $timeout(function() {
          // wait for grid to ingest data changes
          $scope.gridApi.infiniteScroll.dataRemovedTop($scope.firstPage > 0, $scope.lastPage < 4);
        });
      } else {
        $scope.data = $scope.data.slice(0, 400);
        $scope.lastPage--;
        $timeout(function() {
          // wait for grid to ingest data changes
          $scope.gridApi.infiniteScroll.dataRemovedBottom($scope.firstPage > 0, $scope.lastPage < 4);
        });
      }
    }
  };
 
  $scope.reset = function() {
    $scope.firstPage = 2;
    $scope.lastPage = 40;
 
    // turn off the infinite scroll handling up and down - hopefully this won't be needed after @swalters scrolling changes
    $scope.gridApi.infiniteScroll.setScrollDirections( false, false );
    $scope.data = [];
 
    $scope.getFirstData().then(function(){
      $timeout(function() {
        // timeout needed to allow digest cycle to complete,and grid to finish ingesting the data
        $scope.gridApi.infiniteScroll.resetScroll( $scope.firstPage > 0, $scope.lastPage < 4 );
      });
    });
  };
 
  $scope.getFirstData().then(function(){
    $timeout(function() {
      // timeout needed to allow digest cycle to complete,and grid to finish ingesting the data
      // you need to call resetData once you've loaded your data if you want to enable scroll up,
      // it adjusts the scroll position down one pixel so that we can generate scroll up events
      $scope.gridApi.infiniteScroll.resetScroll( $scope.firstPage > 0, $scope.lastPage < 4 );
    });
  });
 
}]);




//# sourceMappingURL=app.js.map