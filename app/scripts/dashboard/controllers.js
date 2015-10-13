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
                  	"showBorder": "0",
					"bgAlpha" : "50",
					"bgColor" : "f7f7f7",
					showlegend: "0",
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
                }]
              };
            });
            
            
angular.module('app.controllers')
.controller('merchantVolumeByType', function ($scope) {
              $scope.datasource = {
					chart: {
						"palette": "2",
						"showvalues": "0",
						"divlinedecimalprecision": "1",
						"limitsdecimalprecision": "1",
						"pyaxisname": "Amount",
						"syaxisname": "Quantity",
						"numberprefix": "$",
						"formatnumberscale": "0",
						"showBorder": "0",
						"theme": "zune",
						"bgAlpha" : "50",
						"bgColor" : "f7f7f7",
						showlegend: "0",
					},
					"categories": [
						{
							"category": [
								{
									"label": "A"
								},
								{
									"label": "B"
								},
								{
									"label": "C"
								},
								{
									"label": "D"
								},
								{
									"label": "E"
								},
								{
									"label": "F"
								},
								{
									"label": "G"
								},
								{
									"label": "H"
								},
								{
									"label": "I"
								},
								{
									"label": "J"
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
								},
								{
									"value": "2696"
								},
								{
									"value": "1287"
								},
								{
									"value": "2140"
								},
								{
									"value": "1603"
								},
								{
									"value": "1628"
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
								},
								{
									"value": "1126"
								},
								{
									"value": "987"
								},
								{
									"value": "1610"
								},
								{
									"value": "903"
								},
								{
									"value": "928"
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
					startingangle: "80",
					showlabels: "1",
					showlegend: "0",
					enablemultislicing: "0",
					slicingdistance: "15",
					showpercentvalues: "0",
					showpercentintooltip: "0",
					theme: "fint",
					"bgAlpha" : "50",
					"bgColor" : "f7f7f7",
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
				"legendshadow": "0",
				"legendborderalpha": "0",
				"palettecolors": "#f8bd19,#008ee4,#33bdda,#e44a00,#6baa01,#583e78",
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