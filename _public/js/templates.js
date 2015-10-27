(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('app/assets/index.html', '<!DOCTYPE html>\r\n<html lang=\"en\" ng-app=\"app\">\r\n  <head>\r\n    <meta charset=\"utf-8\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <meta name=\"description\" content=\"\">\r\n    <meta name=\"author\" content=\"\">\r\n    <title ng-bind-template=\"{{pageTitle}}\"></title>\r\n    \r\n    <link rel=\"stylesheet\" href=\"/css/app.css\"><!--[if lte IE 7]>\r\n    <script src=\"http://cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js\"></script><![endif]--><!--[if lte IE 8]>\r\n    <script src=\"//html5shiv.googlecode.com/svn/trunk/html5.js\"></script><![endif]-->\r\n    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css\">\r\n    <script>\r\n      window.brunch = window.brunch || {};\r\n      window.brunch[\'auto-reload\'] = {\r\n        enabled: true\r\n      };\r\n    </script>\r\n    <script src=\"/js/vendor.js\"></script>\r\n    <script src=\"/js/templates.js\"></script>\r\n    <script src=\"/js/app.js\"></script>\r\n  </head>\r\n  <body ng-controller=\"AppCtrl\">\r\n  \r\n\r\n   <!-- Header Start -->\r\n    <header>\r\n      <a href=\"index.html\" class=\"logo\">\r\n        <img src=\"/img/logo.png\" alt=\"Logo\"/>\r\n      </a>\r\n      <div class=\"pull-right\">\r\n        <ul id=\"mini-nav\" class=\"clearfix\">\r\n      \r\n    \r\n          \r\n       \r\n          <li class=\"list-box user-profile\">\r\n          \r\n            <a id=\"drop7\" href=\"#\" role=\"button\" class=\"dropdown-toggle user-avtar\" data-toggle=\"dropdown\">\r\n             	<i class=\"fa fa-angle-down\"></i> <span class=\"capitalize\">merchant View </span>\r\n             	<i class=\"fa fa-user\"></i>\r\n             	\r\n             	\r\n            </a>\r\n            <ul class=\"dropdown-menu server-activity\">\r\n              <li>\r\n                <p><a href=\"/index.cfm?action=dashboard&role=merchant\"><i class=\"fa fa-check text-success\"></i> Merchant View</a></p>\r\n              </li>\r\n              \r\n              <li>\r\n                <p><a href=\"/index.cfm?action=dashboard&role=b2b\"><i class=\"fa fa-chevron-right text-info\"></i> B2B View</a></p>\r\n              </li>\r\n               <li>\r\n                <p><a href=\"/index.cfm?action=dashboard&role=sales_partner\"><i class=\"fa fa-chevron-right text-info\"></i> Sales Partner View</a></p>\r\n              </li>\r\n              <li>\r\n                <p><a href=\"/index.cfm?action=dashboard&role=staff\"><i class=\"fa fa-chevron-right text-info\"></i> Sterling Staff View</a></p>\r\n              </li>\r\n               <li>\r\n                <p><i class=\"fa fa-cog text-danger\"></i> Account Settings</p>\r\n              </li>\r\n              <li>\r\n                <div class=\"demo-btn-group clearfix\">\r\n                  <button href=\"#\" class=\"btn btn-danger\">\r\n                    Logout\r\n                  </button>\r\n                </div>\r\n              </li>\r\n            </ul>\r\n          </li>\r\n        </ul>\r\n      </div>\r\n    </header>\r\n    <!-- Header End -->\r\n  \r\n  \r\n      <!-- Main Container start -->\r\n    <div class=\"dashboard-container\">\r\n\r\n      <div class=\"container\">\r\n        <!-- Top Nav Start -->\r\n       \r\n       \r\n       <!-- TABS GO HERE --->\r\n       \r\n		<nav-tabs></nav-tabs>\r\n		<div ng-view class=\"view-frame\"></div>\r\n				\r\n		\r\n        <footer>\r\n          <p>© Sterling Payment Technologies 2001-2015</p>\r\n        </footer>\r\n\r\n      </div>\r\n    </div>\r\n    <!-- Main Container end -->\r\n\r\n\r\n\r\n\r\n  </body>\r\n</html>');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('app/assets/index_original.html', '<!DOCTYPE html>\r\n<html lang=\"en\" ng-app=\"app\">\r\n  <head>\r\n    <meta charset=\"utf-8\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <meta name=\"description\" content=\"\">\r\n    <meta name=\"author\" content=\"\">\r\n    <title ng-bind-template=\"{{pageTitle}}\"></title>\r\n    <link rel=\"stylesheet\" href=\"/css/app.css\"><!--[if lte IE 7]>\r\n    <script src=\"http://cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js\"></script><![endif]--><!--[if lte IE 8]>\r\n    <script src=\"//html5shiv.googlecode.com/svn/trunk/html5.js\"></script><![endif]-->\r\n    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css\">\r\n    <script>\r\n      window.brunch = window.brunch || {};\r\n      window.brunch[\'auto-reload\'] = {\r\n        enabled: true\r\n      };\r\n    </script>\r\n    <script src=\"/js/vendor.js\"></script>\r\n    <script src=\"/js/templates.js\"></script>\r\n    <script src=\"/js/app.js\"></script>\r\n  </head>\r\n  <body ng-controller=\"AppCtrl\">\r\n    <div class=\"wrapper\">\r\n      <div class=\"navbar navbar-static-top\">\r\n        <div class=\"navbar-inner\">\r\n          <div class=\"container\">\r\n            <button data-toggle=\"collapse\" data-target=\".nav-collapse\" class=\"btn btn-navbar\"><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span></button><a href=\"/\" class=\"brand\">Angular Brunch Seed</a> \r\n            <div class=\"nav-collapse\">\r\n              <div ng-include=\"\'partials/nav.html\'\"></div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n      <div class=\"container main-content\">\r\n        <div ng-view></div>\r\n        <div>Angular Brunch Seed app: <i class=\"fa fa-search\"></i> <span app-version></span></div>\r\n      </div>\r\n      <div class=\"push\"></div>\r\n    </div>\r\n    <footer class=\"footer\">\r\n      <div class=\"container\">\r\n        <p><small><a href=\"https://github.com/scotch/angular-brunch-seed\">angular-brunch-seed | source</a></small></p>\r\n      </div>\r\n    </footer>\r\n  </body>\r\n</html>');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/dashboard/ar.html', '<!-- Sub Nav End -->\r\n<div class=\"sub-nav <!---hidden-sm hidden-xs--->\">\r\n\r\n	<div class=\"col-xs-12 col-sm-4\">\r\n		<nav-hierarchy></nav-hierarchy>\r\n	</div>\r\n	<div class=\"col-xs-12 col-sm-3\">\r\n		<nav-date-range></nav-date-range>\r\n	</div>\r\n\r\n</div>\r\n<!-- Sub Nav End -->\r\n        \r\n        \r\n        \r\n<!-- Dashboard Wrapper Start -->\r\n<div class=\"dashboard-wrapper-lg\">\r\n	<div class=\"view-container\">\r\n\r\n\r\n		<h2>AR Dashboard iFrame Goes Here</h2>\r\n\r\n	</div> \r\n</div>\r\n<!-- Dashboard Wrapper End -->\r\n\r\n\r\n');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/dashboard/cfo.html', '<!-- Sub Nav End -->\r\n<div class=\"sub-nav <!---hidden-sm hidden-xs--->\">\r\n\r\n	<div class=\"col-xs-12 col-sm-4\">\r\n		<nav-hierarchy></nav-hierarchy>\r\n	</div>\r\n	<div class=\"col-xs-12 col-sm-3\">\r\n		<nav-date-range></nav-date-range>\r\n	</div>\r\n\r\n</div>\r\n<!-- Sub Nav End -->\r\n        \r\n        \r\n<!-- Dashboard Wrapper Start -->\r\n<div class=\"dashboard-wrapper-lg\">\r\n	<div class=\"view-container\">\r\n\r\n						  <h2>CFO Dashboard</h2>\r\n  \r\n\r\n						<div class=\"row marketing\">\r\n						  <datepicker ng-model=\"start\" show-weeks=\"false\"></datepicker> {{start | date}}\r\n						</div>\r\n\r\n\r\n\r\n						<div class=\"row marketing\">\r\n						  <tabset>\r\n							<tab heading=\"A\">\r\n								Hello A!\r\n							</tab>\r\n							<tab heading=\"B\">\r\n								Hello B!\r\n							</tab>\r\n							<tab heading=\"C\">\r\n								Hello C!\r\n							</tab>\r\n							<tab heading=\"D\">\r\n								Hello D!\r\n							</tab>\r\n						  </tabset> \r\n						</div>\r\n\r\n\r\n						<div ng-controller=\"MainCtrl\">\r\n\r\n							<div class=\"row marketing\" >\r\n							  <div class=\"btn-group\">\r\n									<button type=\"button\" class=\"btn btn-primary\" ng-model=\"val\" btn-radio=\"\'A\'\">A</button>\r\n									<button type=\"button\" class=\"btn btn-primary\" ng-model=\"val\" btn-radio=\"\'B\'\">B</button>\r\n									<button type=\"button\" class=\"btn btn-primary\" ng-model=\"val\" btn-radio=\"\'C\'\">C</button>\r\n							  </div>\r\n							</div>\r\n\r\n							<div class=\"row marketing\">\r\n							  <input type=\"text\" ng-model=\"selected\" typeahead=\"state for state in states\" class=\"form-control\">\r\n							</div>\r\n\r\n	\r\n	\r\n	\r\n\r\n								  <div ng-controller=\"TodoCtrl\"><span>{{remaining()}} of {{todos.length}} remaining</span> [<a href=\"\" ng-click=\"archive()\">archive</a>]\r\n									<ul class=\"unstyled\">\r\n									  <li ng-repeat=\"todo in todos\">\r\n										<label class=\"checkbox inline\">\r\n										  <input type=\"checkbox\" ng-model=\"todo.done\"/><span class=\"done{{todo.done}}\">{{todo.text}}</span>\r\n										</label>\r\n									  </li>\r\n									</ul>\r\n\r\n\r\n									<form ng-submit=\"addTodo()\" class=\"form-inline\">\r\n									  <p>\r\n										<input type=\"text\" ng-model=\"todoText\" size=\"30\" placeholder=\"add new todo here\"/>\r\n										<input type=\"submit\" value=\"add\" class=\"btn btn-primary\"/>\r\n									  </p>\r\n									</form>\r\n								  </div>\r\n\r\n\r\n\r\n	\r\n						</div>\r\n\r\n\r\n	</div>\r\n</div>\r\n\r\n');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/dashboard/merchant.html', '<!-- Sub Nav End -->\r\n<div class=\"sub-nav <!---hidden-sm hidden-xs--->\">\r\n\r\n	<div class=\"col-xs-12 col-sm-4\">\r\n		<nav-hierarchy></nav-hierarchy>\r\n	</div>\r\n	<div class=\"col-xs-12 col-sm-3\">\r\n		<nav-date-range></nav-date-range>\r\n	</div>\r\n\r\n</div>\r\n<!-- Sub Nav End -->\r\n        \r\n        \r\n<!-- Dashboard Wrapper Start -->\r\n<div class=\"dashboard-wrapper-lg\">\r\n	<div class=\"view-container\">\r\n\r\n\r\n\r\n        \r\n        <!-- Row starts -->\r\n          <div class=\"row\" ng-controller=\"status_boxes\">\r\n          \r\n          \r\n            <div class=\"col-lg-3 col-md-3 col-sm-6\" ng-repeat=\"item in data\">\r\n              <div class=\"mini-widget {{item.widgetClass}}\">\r\n                <div class=\"mini-widget-heading clearfix\">\r\n                  <div class=\"pull-left\">{{item.title}}</div>\r\n                  <div class=\"pull-right\">{{item.subText}}</div>\r\n                </div>\r\n                <div class=\"mini-widget-body clearfix\">\r\n                  <div class=\"pull-left\">\r\n                    <i class=\"fa {{item.icon}}\"></i>\r\n                  </div>\r\n                  <div class=\"pull-right number\">{{item.largeText}}</div>\r\n                </div>\r\n                <div class=\"mini-widget-footer center-align-text\">\r\n                  <span>{{item.linkText}}</span>\r\n                </div>\r\n              </div>\r\n            </div>\r\n           \r\n           \r\n           \r\n          </div>\r\n          <!-- Row ends -->\r\n\r\n       \r\n            \r\n              \r\n                <div class=\"row\" ng-controller=\"ad_space\">\r\n					<div class=\"col-xs-8\">\r\n\r\n						<div class=\"widget\">\r\n							<div class=\"widget-body\">\r\n							  <!-- Row starts -->\r\n							  <div class=\"row\">\r\n								<img ng-src=\"{{ad_img}}\" class=\"img-responsive\">\r\n								</div>\r\n							  <!-- Row ends -->\r\n							</div>\r\n						</div> <!-- widget ends -->\r\n				\r\n					\r\n					\r\n						 <div class=\"row\">\r\n  \r\n							<!--- VOLUME SUMMARY ---> \r\n							<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-12\">\r\n							  <div class=\"widget\">\r\n								<div class=\"widget-header\">\r\n								  <div class=\"title\">\r\n										Volume Summary\r\n									<span class=\"mini-title\">\r\n			  \r\n									</span>\r\n								  </div>\r\n								  <!---<span class=\"tools\">\r\n									<a class=\"btn btn-success btn-xs\" href=\"##\">\r\n									  <i class=\"fa fa-cog\"></i>\r\n									</a>\r\n								  </span>--->\r\n								</div>\r\n								<div class=\"widget-body\" ng-controller=\"merchantVolumeSummary\">\r\n										<fusioncharts\r\n											width=\"100%\" \r\n											height=\"200\"\r\n											type=\"bar2d\"\r\n											dataSource=\"{{datasource}}\">\r\n										</fusioncharts>\r\n								</div>\r\n							  </div>\r\n							</div>\r\n							<!--- END: VOLUME SUMMARY ---> \r\n	\r\n	\r\n							<!--- VOLUME TREND BY TYPE ---> \r\n							<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-12\">\r\n							  <div class=\"widget\">\r\n								<div class=\"widget-header\">\r\n								  <div class=\"title\">\r\n									Volume by Card Type\r\n			 \r\n								  </div>\r\n								  <!---<span class=\"tools\">\r\n									<a class=\"btn btn-success btn-xs\" href=\"##\">\r\n									  <i class=\"fa fa-cog\"></i>\r\n									</a>\r\n								  </span>--->\r\n								</div>\r\n								<div class=\"widget-body\" ng-controller=\"merchantVolumeByType\">\r\n										<fusioncharts\r\n											width=\"100%\" \r\n											height=\"200\"\r\n											type=\"mscombi2d\"\r\n											chartid=\"john2\"\r\n											dataSource=\"{{datasource}}\">\r\n										</fusioncharts>\r\n				   \r\n								</div>\r\n							  </div>\r\n							</div>\r\n						   <!--- END: VOLUME TREND BY TYPE ---> \r\n   \r\n						   <!--- VOLUME DETAILS ---> \r\n	\r\n							<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-12\">\r\n							  <div class=\"widget\">\r\n								<div class=\"widget-header\">\r\n								  <div class=\"title\">\r\n									Volume Details (YTD)\r\n			 \r\n								  </div>\r\n								  <!---<span class=\"tools\">\r\n									<a class=\"btn btn-success btn-xs\" href=\"##\">\r\n									  <i class=\"fa fa-cog\"></i>\r\n									</a>\r\n								  </span>--->\r\n								</div>\r\n								<div class=\"widget-body\">\r\n		  \r\n		  \r\n								   <div class=\"widget-stats-text\">Sales: $1,405,212.18</div>\r\n								   <div class=\"widget-stats-text\">Transactions:  85,017</div>\r\n								   <div class=\"widget-stats-text\">Average Ticket: $16.53</div>\r\n								   <div class=\"widget-stats-text\">Returns: $7,938.72</div>\r\n								   <div class=\"widget-stats-text\">Voids: $1,938.09</div>\r\n								   <div class=\"widget-stats-text\">Fees: $128.14</div>\r\n								   <div class=\"widget-stats-text\">Net: <b>$1,397,273.46</b></div>\r\n		  \r\n								</div>\r\n							  </div>\r\n							</div>\r\n	\r\n							 <!--- END: VOLUME DETAILS --->\r\n	\r\n						</div>  <!-- end .row -->\r\n			\r\n								<!-- Row Start -->\r\n							<div class=\"row\">\r\n							  <div class=\"col-lg-8 col-md-8\">\r\n								<div class=\"widget\">\r\n								  <div class=\"widget-header\">\r\n									<div class=\"title\">\r\n									  Deposit History\r\n									</div>\r\n									<!---<span class=\"tools\">\r\n									<a class=\"btn btn-success btn-xs\" href=\"##\">\r\n									  <i class=\"fa fa-cog\"></i>\r\n									</a>\r\n								  </span>--->\r\n								  </div>\r\n								  <div class=\"widget-body\" ng-controller=\"merchantDepositHistory\">\r\n										<fusioncharts\r\n											width=\"100%\" \r\n											height=\"200\"\r\n											type=\"msline\"\r\n											chart=\"{{attrs}}\"\r\n											categories=\"{{categories}}\"\r\n											dataset=\"{{dataset}}\">\r\n										</fusioncharts>\r\n								  </div>\r\n								</div>\r\n							  </div>\r\n			  \r\n			  \r\n							<!--- VOLUME TREND BY TYPE ---> \r\n							<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-12\">\r\n							  <div class=\"widget\">\r\n								<div class=\"widget-header\">\r\n								  <div class=\"title\">\r\n									Volume by Card Type\r\n								  </div>\r\n								</div>\r\n								<div class=\"widget-body\" ng-controller=\"merchantPieVolume\">\r\n										<fusioncharts\r\n											width=\"100%\" \r\n											height=\"200\"\r\n											type=\"pie3d\"\r\n											dataSource=\"{{datasource}}\">\r\n										</fusioncharts>\r\n								</div>\r\n							  </div>\r\n							</div>\r\n						   <!--- END: VOLUME TREND BY TYPE ---> \r\n					</div>\r\n					<!-- Row End -->\r\n			\r\n            </div>\r\n			<div class=\"col-xs-4\">\r\n						 \r\n						 \r\n						    \r\n			 <!--- ANNOUNCEMENTS --->\r\n            \r\n        		 <div class=\"widget\">\r\n					<div class=\"widget-header\">\r\n					  <div class=\"title\">\r\n						Announcements\r\n					  </div>\r\n					</div>\r\n					<div class=\"widget-body\">\r\n					  <ul class=\"announcements\" ng-controller=\"announcementCtrl\">\r\n						<li class=\"announcement-list\" ng-repeat=\"item in announcements\">\r\n						  <div class=\"detail-info\">\r\n							<a href=\"\" class=\"header\">\r\n							  <i class=\"fa {{item.icon}}\" ></i> {{item.title}} \r\n							</a>\r\n							<p class=\"message\" ng-bind-html=\"item.body\">\r\n							 \r\n							</p>\r\n						  </div>\r\n						</li>\r\n						\r\n				   \r\n					  </ul>\r\n					</div>\r\n         \r\n             <!--- END: ANNOUNCEMENTS --->\r\n            \r\n            \r\n				\r\n					</div>\r\n					\r\n					\r\n			  </div>\r\n			  <!-- Row End -->\r\n          \r\n\r\n	</div> \r\n</div>\r\n<!-- Dashboard Wrapper End -->\r\n\r\n\r\n');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/nav/daterange.html', '<div class=\"form-group\">\r\n  <input date-range-picker class=\"form-control date-picker\" type=\"text\"\r\n	   name=\"date\" ng-model=\"date\" placeholder=\"Data Range\" style=\"margin-top:10px\">\r\n</div>');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/nav/hierarchy.html', '<ol class=\"nya-bs-select\" ng-model=\"myModel\" style=\"width:100%\" data-live-search=\"true\" multiple data-size=\"10\">\r\n    <li data-value=\"7973770\" class=\"nya-bs-option\">\r\n        <a>\r\n           <span class=\'hq\'><i class=\'fa fa-cubes\'></i> Headquarter name</span> <small class=\'muted text-muted\'>7973770</small>\r\n           <span class=\"glyphicon glyphicon-ok check-mark\"></span>\r\n        </a>\r\n    </li>\r\n    <li data-value=\"9021303\" class=\"nya-bs-option\">\r\n        <a>\r\n           <span style=\'padding-left:15px;\'><i class=\'fa fa-building\'></i> Corporation name</span> <small class=\'muted text-muted\'>9021303</small>\r\n           <span class=\"glyphicon glyphicon-ok check-mark\"></span>\r\n        </a>\r\n    </li>\r\n    <li data-value=\"77488788772\" class=\"nya-bs-option\">\r\n        <a>\r\n           <span style=\'padding-left:30px;\'><i class=\'fa fa-flag\'></i> Merchant name 2</span> <small class=\'muted text-muted\'>77488788772</small>\r\n           <span class=\"glyphicon glyphicon-ok check-mark\"></span>\r\n        </a>\r\n    </li>\r\n    <li data-value=\"77488788773\" class=\"nya-bs-option\">\r\n        <a>\r\n           <span style=\'padding-left:30px;\'><i class=\'fa fa-flag\'></i> Merchant name 3</span> <small class=\'muted text-muted\'>77488788773</small>\r\n           <span class=\"glyphicon glyphicon-ok check-mark\"></span>\r\n        </a>\r\n    </li>\r\n    <li data-value=\"77488788774\" class=\"nya-bs-option\">\r\n        <a>\r\n           <span style=\'padding-left:30px;\'><i class=\'fa fa-flag\'></i> Merchant name 4</span> <small class=\'muted text-muted\'>77488788774</small>\r\n           <span class=\"glyphicon glyphicon-ok check-mark\"></span>\r\n        </a>\r\n    </li>\r\n    <li data-value=\"77488788775\" class=\"nya-bs-option\">\r\n        <a>\r\n          <span style=\'padding-left:30px;\'><i class=\'fa fa-flag\'></i> Merchant name 5</span> <small class=\'muted text-muted\'>77488788775</small>\r\n          <span class=\"glyphicon glyphicon-ok check-mark\"></span>\r\n        </a>\r\n    </li>\r\n    <li data-value=\"77488788776\" class=\"nya-bs-option\">\r\n        <a>\r\n        	<span style=\'padding-left:30px;\'><i class=\'fa fa-flag\'></i> Merchant name 6</span> <small class=\'muted text-muted\'>77488788776</small>\r\n        	<span class=\"glyphicon glyphicon-ok check-mark\"></span>\r\n        </a>\r\n    </li>\r\n</ol>\r\n');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/nav/tabs.html', '<div id=\'cssmenu\' >\r\n  <ul>\r\n	<li ng-class=\"activeTab == tab ? \'active\' : \'not-active\'\" ng-repeat=\"tab in tabs\" ng-click=\"setTab(tab)\">\r\n	  <a ng-href=\"#{{tab.url}}\">\r\n		<i class=\"fa {{tab.icon}}\"></i>\r\n		{{tab.display}}\r\n	  </a>\r\n	  \r\n	   <ul>\r\n		  	<li ng-repeat=\"child in tab.menuItems\" ng-click=\"setTab(child)\">\r\n				<a ng-href=\"#{{child.url}}\">\r\n				{{child.display}}\r\n				</a>\r\n				\r\n				   <ul>\r\n						<li ng-repeat=\"submenu1 in child.menuItems\" ng-click=\"setTab(submenu1)\">\r\n							<a ng-href=\"#{{submenu1.url}}\">\r\n							{{submenu1.display}}\r\n							</a>\r\n						</li>\r\n				  </ul>\r\n	  \r\n			</li>\r\n	  </ul>\r\n	\r\n	</li>\r\n\r\n  </ul>\r\n</div>\r\n<!-- Top Nav End -->');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/transactions/columns.html', ' <table class=\"table table-condensed table-striped table-bordered table-hover no-margin\">\r\n			<tbody>\r\n			  <tr>\r\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"1\"  checked id=\"showhide_dbaname\"/> </td>\r\n				<td> <label for=\"showhide_dbaname\" class=\"name\"> DBA Name </label> </td>\r\n			  </tr>\r\n			  <tr>\r\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"2\" checked id=\"showhide_state\" /> </td>\r\n				<td> <label for=\"showhide_state\" class=\"name\"> State </label> </td>\r\n			  </tr>\r\n			  <tr>\r\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"3\"  checked id=\"showhide_terminal\"/> </td>\r\n				<td> <label for=\"showhide_terminal\" class=\"name\"> Terminal </label> </td>\r\n			  </tr>\r\n			  <tr>\r\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"4\" checked id=\"showhide_authdate\"/> </td>\r\n				<td> <label for=\"showhide_authdate\" class=\"name\"> Auth Date </label> </td>\r\n			  </tr>\r\n			  <tr>\r\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"5\" checked id=\"showhide_cardtype\"/> </td>\r\n				<td> <label for=\"showhide_cardtype\" class=\"name\">  Card Type </label> </td>\r\n			  </tr>\r\n			   <tr>\r\n					<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"6\" checked id=\"showhide_cardno\"/> </td>\r\n					<td> <label for=\"showhide_cardno\" class=\"name\"> Card Number </label> </td>\r\n			  </tr>\r\n			  <tr>\r\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"7\" checked id=\"showhide_transtype\"/> </td>\r\n				<td> <label for=\"showhide_transtype\" class=\"name\"> Trans Type </label> </td>\r\n			  </tr>\r\n			   <tr>\r\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"8\" checked id=\"showhide_method\"/> </td>\r\n				<td> <label for=\"showhide_method\" class=\"name\"> Method </label> </td>\r\n			  </tr>\r\n			  <tr>\r\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"9\" checked id=\"showhide_response\"/> </td>\r\n				<td> <label for=\"showhide_response\" class=\"name\">  Response </label> </td>\r\n			  </tr>\r\n			</tbody>\r\n		  </table>');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/transactions/default.html', '<div ng-controller=\"transactionsCtrl\">\r\n\r\n    <!-- Sub Nav End -->\r\n	<div class=\"sub-nav <!--hidden-sm hidden-xs-->\">\r\n\r\n		<div class=\"col-xs-12 col-sm-4\">\r\n			<nav-hierarchy></nav-hierarchy>\r\n		</div>\r\n		<div class=\"col-xs-12 col-sm-3\">\r\n			<nav-date-range></nav-date-range>\r\n		</div>\r\n		\r\n		\r\n		<div class=\"col-xs-12 col-sm-4\">\r\n		\r\n			<button uib-popover-template=\"filterPopover.templateUrl\" popover-title=\"{{filterPopover.title}}\" popover-placement=\"bottom\" type=\"button\" class=\"btn btn-md btn-info\"><i class=\"fa fa-filter\"></i> Filters</button>\r\n\r\n			<button uib-popover-template=\"columnsPopover.templateUrl\" popover-title=\"{{columnsPopover.title}}\" popover-placement=\"bottom\" type=\"button\" class=\"btn btn-md btn-primary\"><i class=\"fa fa-eye-slash\"></i> Columns</button>\r\n\r\n			<button uib-popover-template=\"summarizePopover.templateUrl\" popover-title=\"{{summarizePopover.title}}\" popover-placement=\"bottom\" type=\"button\" class=\"btn btn-md btn-warning\"><i class=\"fa fa-sitemap\"></i> Summarize</button>\r\n\r\n			<button uib-popover-template=\"exportPopover.templateUrl\" popover-title=\"{{exportPopover.title}}\" popover-placement=\"bottom\" type=\"button\" class=\"btn btn-md btn-success\"><i class=\"fa fa-download\"></i> Export</button>\r\n \r\n		</div>   \r\n		  \r\n	</div>\r\n	<!-- Sub Nav End -->\r\n        \r\n        \r\n		\r\n	<!-- Wrapper Start -->\r\n	<div class=\"dashboard-wrapper-lg\">\r\n		<div class=\"view-container\">\r\n			  <div ui-grid=\"gridOptions\" class=\"grid\" ui-grid-infinite-scroll></div>\r\n		</div> \r\n	</div>\r\n	<!-- Wrapper End -->\r\n\r\n</div>\r\n');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/transactions/export.html', '<div class=\"form-group\">\r\n	<button type=\"button\" class=\"btn btn-sm btn-success btn-search\" style=\"width:100%\"><i class=\"fa fa-file-excel-o\"></i> Export to Excel</button>\r\n</div>\r\n<div class=\"form-group\">\r\n	<button type=\"button\" class=\"btn btn-sm btn-info btn-search\" style=\"width:100%\"><i class=\"fa fa-file-text-o\"></i> Export to CSV</button>\r\n</div>');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/transactions/filters.html', '<!--\r\n<div>{{filterPopover.content}}</div>\r\n<ul>\r\n	<li ng-repeat=\"item in filterPopover.items\">{{item.field}} {{item.checked}}</li>\r\n</ul>\r\n\r\n<div class=\"form-group\">\r\n  <label>Psssopup Title:</label>\r\n  <input type=\"text\" ng-model=\"filterPopover.title\" class=\"form-control\">\r\n</div>\r\n\r\n-->\r\n\r\n\r\n<table class=\"table table-condensed table-striped table-bordered table-hover no-margin\">\r\n	<tbody>\r\n	  <tr> \r\n		<td> <span class=\"name\">Batch</span> </td>\r\n		<td> <input type=\"text\" class=\"form-control input-xs\" name=\"search_batch\"> </td>\r\n	  </tr>\r\n	  <tr>\r\n		<td> <span class=\"name\">Type</span> </td>\r\n		<td> <select name=\"cardType\" class=\"form-control input-xs\">\r\n				<option value=\"A\"></option>\r\n				<option value=\"VISA\">VISA</option>\r\n				<option value=\"MAST\">MAST</option>\r\n				<option value=\"VYGR\">VYGR</option>\r\n				<option value=\"DINE\">DINE</option>\r\n				<option value=\"DSCV\">DSCV</option>\r\n				<option value=\"JCB\">JCB</option>\r\n				<option value=\"AEXP\">AEXP</option>\r\n				<option value=\"DISC\">DISC</option>\r\n				<option value=\"DSVR\">DSVR</option>\r\n				<option value=\"AMEX\">AMEX</option>\r\n			</select> </td>\r\n	  </tr>\r\n	  <tr>\r\n		<td> <span class=\"name\">Item No.</span> </td>\r\n		<td> <input type=\"text\" class=\"form-control input-xs\" name=\"search_itemno\"> </td>\r\n	  </tr>\r\n	  <tr>\r\n		<td> <span class=\"name\">Card No</span> </td>\r\n		<td> <input type=\"text\" class=\"form-control input-xs\" name=\"search_cardno\" maxlength=\"4\">  </td>\r\n	  </tr>\r\n	  <tr>\r\n		<td> <span class=\"name\">Terminal</span> </td>\r\n		<td> <input type=\"text\" class=\"form-control input-xs\" name=\"search_terminal\"> </td>\r\n	  </tr>\r\n	  \r\n	  <tr>\r\n		<td> <span class=\"name\">Amount Between</span> </td>\r\n		<td> <input type=\"text\" class=\"form-control input-xs\" name=\"search_amount_min\"> to <input type=\"text\" class=\"form-control input-xs\" name=\"search_amount_max\"> </td>\r\n	  </tr>\r\n	  \r\n	   <tr>\r\n		<td colspan=\"2\" align=\"center\">\r\n		 <button type=\"button\" class=\"btn btn-sm btn-primary btn-search\">Search</button>   </td>\r\n	  </tr>\r\n	</tbody> \r\n  </table>');
    }]);
})();
(function() {
    var module;

    try {
        // Get current templates module
        module = angular.module('templates');
    } catch (error) {
        // Or create a new one
        module = angular.module('templates', []);
    }

    module.run(["$templateCache", function($templateCache) {
        $templateCache.put('partials/transactions/summarize.html', '<table class=\"table table-condensed table-striped table-bordered table-hover no-margin\">\r\n	<tbody>\r\n	  <tr>\r\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"1\"   id=\"showhide_dbaname\"/> </td>\r\n		<td> <label for=\"showhide_dbaname\" class=\"name\"> DBA Name </label> </td>\r\n	  </tr>\r\n	  <tr>\r\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"2\"  id=\"showhide_state\" /> </td>\r\n		<td> <label for=\"showhide_state\" class=\"name\"> State </label> </td>\r\n	  </tr>\r\n	  <tr>\r\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"3\"   id=\"showhide_terminal\"/> </td>\r\n		<td> <label for=\"showhide_terminal\" class=\"name\"> Terminal </label> </td>\r\n	  </tr>\r\n	  <tr>\r\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"4\"  id=\"showhide_authdate\"/> </td>\r\n		<td> <label for=\"showhide_authdate\" class=\"name\"> Auth Date </label> </td>\r\n	  </tr>\r\n	  <tr>\r\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"5\"  id=\"showhide_cardtype\"/> </td>\r\n		<td> <label for=\"showhide_cardtype\" class=\"name\">  Card Type </label> </td>\r\n	  </tr>\r\n	   <tr>\r\n			<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"6\"  id=\"showhide_cardno\"/> </td>\r\n			<td> <label for=\"showhide_cardno\" class=\"name\"> Card Number </label> </td>\r\n	  </tr>\r\n	  <tr>\r\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"7\"  id=\"showhide_transtype\"/> </td>\r\n		<td> <label for=\"showhide_transtype\" class=\"name\"> Trans Type </label> </td>\r\n	  </tr>\r\n	   <tr>\r\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"8\"  id=\"showhide_method\"/> </td>\r\n		<td> <label for=\"showhide_method\" class=\"name\"> Method </label> </td>\r\n	  </tr>\r\n	  <tr>\r\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"9\"  id=\"showhide_response\"/> </td>\r\n		<td> <label for=\"showhide_response\" class=\"name\">  Response </label> </td>\r\n	  </tr>\r\n	</tbody>\r\n</table>');
    }]);
})();

//# sourceMappingURL=templates.js.map