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
        $templateCache.put('partials/dashboard/ar.html', '<!-- Sub Nav End -->\n<div class=\"sub-nav <!---hidden-sm hidden-xs--->\">\n\n	<div class=\"col-xs-12 col-sm-4\">\n		<nav-hierarchy></nav-hierarchy>\n	</div>\n	<div class=\"col-xs-12 col-sm-3\">\n		<nav-date-range></nav-date-range>\n	</div>\n\n</div>\n<!-- Sub Nav End -->\n        \n        \n        \n<!-- Dashboard Wrapper Start -->\n<div class=\"dashboard-wrapper-lg\">\n	<div class=\"view-container\">\n\n\n		<h2>AR Dashboard iFrame Goes Here</h2>\n\n	</div> \n</div>\n<!-- Dashboard Wrapper End -->\n\n\n');
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
        $templateCache.put('partials/dashboard/cfo.html', '<!-- Sub Nav End -->\n<div class=\"sub-nav <!---hidden-sm hidden-xs--->\">\n\n	<div class=\"col-xs-12 col-sm-4\">\n		<nav-hierarchy></nav-hierarchy>\n	</div>\n	<div class=\"col-xs-12 col-sm-3\">\n		<nav-date-range></nav-date-range>\n	</div>\n\n</div>\n<!-- Sub Nav End -->\n        \n        \n<!-- Dashboard Wrapper Start -->\n<div class=\"dashboard-wrapper-lg\">\n	<div class=\"view-container\">\n\n						  <h2>CFO Dashboard</h2>\n  \n\n						<div class=\"row marketing\">\n						  <datepicker ng-model=\"start\" show-weeks=\"false\"></datepicker> {{start | date}}\n						</div>\n\n\n\n						<div class=\"row marketing\">\n						  <tabset>\n							<tab heading=\"A\">\n								Hello A!\n							</tab>\n							<tab heading=\"B\">\n								Hello B!\n							</tab>\n							<tab heading=\"C\">\n								Hello C!\n							</tab>\n							<tab heading=\"D\">\n								Hello D!\n							</tab>\n						  </tabset> \n						</div>\n\n\n						<div ng-controller=\"MainCtrl\">\n\n							<div class=\"row marketing\" >\n							  <div class=\"btn-group\">\n									<button type=\"button\" class=\"btn btn-primary\" ng-model=\"val\" btn-radio=\"\'A\'\">A</button>\n									<button type=\"button\" class=\"btn btn-primary\" ng-model=\"val\" btn-radio=\"\'B\'\">B</button>\n									<button type=\"button\" class=\"btn btn-primary\" ng-model=\"val\" btn-radio=\"\'C\'\">C</button>\n							  </div>\n							</div>\n\n							<div class=\"row marketing\">\n							  <input type=\"text\" ng-model=\"selected\" typeahead=\"state for state in states\" class=\"form-control\">\n							</div>\n\n	\n	\n	\n\n								  <div ng-controller=\"TodoCtrl\"><span>{{remaining()}} of {{todos.length}} remaining</span> [<a href=\"\" ng-click=\"archive()\">archive</a>]\n									<ul class=\"unstyled\">\n									  <li ng-repeat=\"todo in todos\">\n										<label class=\"checkbox inline\">\n										  <input type=\"checkbox\" ng-model=\"todo.done\"/><span class=\"done{{todo.done}}\">{{todo.text}}</span>\n										</label>\n									  </li>\n									</ul>\n\n\n									<form ng-submit=\"addTodo()\" class=\"form-inline\">\n									  <p>\n										<input type=\"text\" ng-model=\"todoText\" size=\"30\" placeholder=\"add new todo here\"/>\n										<input type=\"submit\" value=\"add\" class=\"btn btn-primary\"/>\n									  </p>\n									</form>\n								  </div>\n\n\n\n	\n						</div>\n\n\n	</div>\n</div>\n\n');
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
        $templateCache.put('partials/dashboard/merchant.html', '<!-- Sub Nav End -->\n<div class=\"sub-nav <!---hidden-sm hidden-xs--->\">\n\n	<div class=\"col-xs-12 col-sm-4\">\n		<nav-hierarchy></nav-hierarchy>\n	</div>\n	<div class=\"col-xs-12 col-sm-3\">\n		<nav-date-range></nav-date-range>\n	</div>\n\n</div>\n<!-- Sub Nav End -->\n        \n        \n<!-- Dashboard Wrapper Start -->\n<div class=\"dashboard-wrapper-lg\">\n	<div class=\"view-container\">\n\n\n\n        \n        <!-- Row starts -->\n          <div class=\"row\" ng-controller=\"status_boxes\">\n          \n          \n            <div class=\"col-lg-3 col-md-3 col-sm-6\" ng-repeat=\"item in data\">\n              <div class=\"mini-widget {{item.widgetClass}}\">\n                <div class=\"mini-widget-heading clearfix\">\n                  <div class=\"pull-left\">{{item.title}}</div>\n                  <div class=\"pull-right\">{{item.subText}}</div>\n                </div>\n                <div class=\"mini-widget-body clearfix\">\n                  <div class=\"pull-left\">\n                    <i class=\"fa {{item.icon}}\"></i>\n                  </div>\n                  <div class=\"pull-right number\">{{item.largeText}}</div>\n                </div>\n                <div class=\"mini-widget-footer center-align-text\">\n                  <span>{{item.linkText}}</span>\n                </div>\n              </div>\n            </div>\n           \n           \n           \n          </div>\n          <!-- Row ends -->\n\n       \n            \n              \n                <div class=\"row\" ng-controller=\"ad_space\">\n					<div class=\"col-xs-8\">\n\n						<div class=\"widget\">\n							<div class=\"widget-body\">\n							  <!-- Row starts -->\n							  <div class=\"row\">\n								<img ng-src=\"{{ad_img}}\" class=\"img-responsive\">\n								</div>\n							  <!-- Row ends -->\n							</div>\n						</div> <!-- widget ends -->\n				\n					\n					\n						 <div class=\"row\">\n  \n							<!--- VOLUME SUMMARY ---> \n							<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-12\">\n							  <div class=\"widget\">\n								<div class=\"widget-header\">\n								  <div class=\"title\">\n										Volume Summary\n									<span class=\"mini-title\">\n			  \n									</span>\n								  </div>\n								  <!---<span class=\"tools\">\n									<a class=\"btn btn-success btn-xs\" href=\"##\">\n									  <i class=\"fa fa-cog\"></i>\n									</a>\n								  </span>--->\n								</div>\n								<div class=\"widget-body\" ng-controller=\"merchantVolumeSummary\">\n										<fusioncharts\n											width=\"100%\" \n											height=\"200\"\n											type=\"bar2d\"\n											dataSource=\"{{datasource}}\">\n										</fusioncharts>\n								</div>\n							  </div>\n							</div>\n							<!--- END: VOLUME SUMMARY ---> \n	\n	\n							<!--- VOLUME TREND BY TYPE ---> \n							<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-12\">\n							  <div class=\"widget\">\n								<div class=\"widget-header\">\n								  <div class=\"title\">\n									Volume by Card Type\n			 \n								  </div>\n								  <!---<span class=\"tools\">\n									<a class=\"btn btn-success btn-xs\" href=\"##\">\n									  <i class=\"fa fa-cog\"></i>\n									</a>\n								  </span>--->\n								</div>\n								<div class=\"widget-body\" ng-controller=\"merchantVolumeByType\">\n										<fusioncharts\n											width=\"100%\" \n											height=\"200\"\n											type=\"mscombi2d\"\n											chartid=\"john2\"\n											dataSource=\"{{datasource}}\">\n										</fusioncharts>\n				   \n								</div>\n							  </div>\n							</div>\n						   <!--- END: VOLUME TREND BY TYPE ---> \n   \n						   <!--- VOLUME DETAILS ---> \n	\n							<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-12\">\n							  <div class=\"widget\">\n								<div class=\"widget-header\">\n								  <div class=\"title\">\n									Volume Details (YTD)\n			 \n								  </div>\n								  <!---<span class=\"tools\">\n									<a class=\"btn btn-success btn-xs\" href=\"##\">\n									  <i class=\"fa fa-cog\"></i>\n									</a>\n								  </span>--->\n								</div>\n								<div class=\"widget-body\">\n		  \n		  \n								   <div class=\"widget-stats-text\">Sales: $1,405,212.18</div>\n								   <div class=\"widget-stats-text\">Transactions:  85,017</div>\n								   <div class=\"widget-stats-text\">Average Ticket: $16.53</div>\n								   <div class=\"widget-stats-text\">Returns: $7,938.72</div>\n								   <div class=\"widget-stats-text\">Voids: $1,938.09</div>\n								   <div class=\"widget-stats-text\">Fees: $128.14</div>\n								   <div class=\"widget-stats-text\">Net: <b>$1,397,273.46</b></div>\n		  \n								</div>\n							  </div>\n							</div>\n	\n							 <!--- END: VOLUME DETAILS --->\n	\n						</div>  <!-- end .row -->\n			\n								<!-- Row Start -->\n							<div class=\"row\">\n							  <div class=\"col-lg-8 col-md-8\">\n								<div class=\"widget\">\n								  <div class=\"widget-header\">\n									<div class=\"title\">\n									  Deposit History\n									</div>\n									<!---<span class=\"tools\">\n									<a class=\"btn btn-success btn-xs\" href=\"##\">\n									  <i class=\"fa fa-cog\"></i>\n									</a>\n								  </span>--->\n								  </div>\n								  <div class=\"widget-body\" ng-controller=\"merchantDepositHistory\">\n										<fusioncharts\n											width=\"100%\" \n											height=\"200\"\n											type=\"msline\"\n											chart=\"{{attrs}}\"\n											categories=\"{{categories}}\"\n											dataset=\"{{dataset}}\">\n										</fusioncharts>\n								  </div>\n								</div>\n							  </div>\n			  \n			  \n							<!--- VOLUME TREND BY TYPE ---> \n							<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-12\">\n							  <div class=\"widget\">\n								<div class=\"widget-header\">\n								  <div class=\"title\">\n									Volume by Card Type\n								  </div>\n								</div>\n								<div class=\"widget-body\" ng-controller=\"merchantPieVolume\">\n										<fusioncharts\n											width=\"100%\" \n											height=\"200\"\n											type=\"pie3d\"\n											dataSource=\"{{datasource}}\">\n										</fusioncharts>\n								</div>\n							  </div>\n							</div>\n						   <!--- END: VOLUME TREND BY TYPE ---> \n					</div>\n					<!-- Row End -->\n			\n            </div>\n			<div class=\"col-xs-4\">\n						 \n						 \n						    \n			 <!--- ANNOUNCEMENTS --->\n            \n        		 <div class=\"widget\">\n					<div class=\"widget-header\">\n					  <div class=\"title\">\n						Announcements\n					  </div>\n					</div>\n					<div class=\"widget-body\">\n					  <ul class=\"announcements\" ng-controller=\"announcementCtrl\">\n						<li class=\"announcement-list\" ng-repeat=\"item in announcements\">\n						  <div class=\"detail-info\">\n							<a href=\"\" class=\"header\">\n							  <i class=\"fa {{item.icon}}\" ></i> {{item.title}} \n							</a>\n							<p class=\"message\" ng-bind-html=\"item.body\">\n							 \n							</p>\n						  </div>\n						</li>\n						\n				   \n					  </ul>\n					</div>\n         \n             <!--- END: ANNOUNCEMENTS --->\n            \n            \n				\n					</div>\n					\n					\n			  </div>\n			  <!-- Row End -->\n          \n\n	</div> \n</div>\n<!-- Dashboard Wrapper End -->\n\n\n');
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
        $templateCache.put('partials/nav/daterange.html', '<div class=\"form-group\">\n  <input date-range-picker class=\"form-control date-picker\" type=\"text\"\n	   name=\"date\" ng-model=\"date\" placeholder=\"Data Range\" style=\"margin-top:10px\">\n</div>');
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
        $templateCache.put('partials/nav/hierarchy.html', '<ol class=\"nya-bs-select\" ng-model=\"myModel\" style=\"width:100%\" data-live-search=\"true\" multiple data-size=\"10\">\n    <li data-value=\"7973770\" class=\"nya-bs-option\">\n        <a>\n           <span class=\'hq\'><i class=\'fa fa-cubes\'></i> Headquarter name</span> <small class=\'muted text-muted\'>7973770</small>\n           <span class=\"glyphicon glyphicon-ok check-mark\"></span>\n        </a>\n    </li>\n    <li data-value=\"9021303\" class=\"nya-bs-option\">\n        <a>\n           <span style=\'padding-left:15px;\'><i class=\'fa fa-building\'></i> Corporation name</span> <small class=\'muted text-muted\'>9021303</small>\n           <span class=\"glyphicon glyphicon-ok check-mark\"></span>\n        </a>\n    </li>\n    <li data-value=\"77488788772\" class=\"nya-bs-option\">\n        <a>\n           <span style=\'padding-left:30px;\'><i class=\'fa fa-flag\'></i> Merchant name 2</span> <small class=\'muted text-muted\'>77488788772</small>\n           <span class=\"glyphicon glyphicon-ok check-mark\"></span>\n        </a>\n    </li>\n    <li data-value=\"77488788773\" class=\"nya-bs-option\">\n        <a>\n           <span style=\'padding-left:30px;\'><i class=\'fa fa-flag\'></i> Merchant name 3</span> <small class=\'muted text-muted\'>77488788773</small>\n           <span class=\"glyphicon glyphicon-ok check-mark\"></span>\n        </a>\n    </li>\n    <li data-value=\"77488788774\" class=\"nya-bs-option\">\n        <a>\n           <span style=\'padding-left:30px;\'><i class=\'fa fa-flag\'></i> Merchant name 4</span> <small class=\'muted text-muted\'>77488788774</small>\n           <span class=\"glyphicon glyphicon-ok check-mark\"></span>\n        </a>\n    </li>\n    <li data-value=\"77488788775\" class=\"nya-bs-option\">\n        <a>\n          <span style=\'padding-left:30px;\'><i class=\'fa fa-flag\'></i> Merchant name 5</span> <small class=\'muted text-muted\'>77488788775</small>\n          <span class=\"glyphicon glyphicon-ok check-mark\"></span>\n        </a>\n    </li>\n    <li data-value=\"77488788776\" class=\"nya-bs-option\">\n        <a>\n        	<span style=\'padding-left:30px;\'><i class=\'fa fa-flag\'></i> Merchant name 6</span> <small class=\'muted text-muted\'>77488788776</small>\n        	<span class=\"glyphicon glyphicon-ok check-mark\"></span>\n        </a>\n    </li>\n</ol>\n');
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
        $templateCache.put('partials/nav/tabs.html', '<div id=\'cssmenu\' >\n  <ul>\n	<li ng-class=\"activeTab == tab ? \'active\' : \'not-active\'\" ng-repeat=\"tab in tabs\" ng-click=\"setTab(tab)\">\n	  <a ng-href=\"#{{tab.url}}\">\n		<i class=\"fa {{tab.icon}}\"></i>\n		{{tab.display}}\n	  </a>\n	  \n	   <ul>\n		  	<li ng-repeat=\"child in tab.menuItems\" ng-click=\"setTab(child)\">\n				<a ng-href=\"#{{child.url}}\">\n				{{child.display}}\n				</a>\n				\n				   <ul>\n						<li ng-repeat=\"submenu1 in child.menuItems\" ng-click=\"setTab(submenu1)\">\n							<a ng-href=\"#{{submenu1.url}}\">\n							{{submenu1.display}}\n							</a>\n						</li>\n				  </ul>\n	  \n			</li>\n	  </ul>\n	\n	</li>\n\n  </ul>\n</div>\n<!-- Top Nav End -->');
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
        $templateCache.put('partials/transactions/columns.html', ' <table class=\"table table-condensed table-striped table-bordered table-hover no-margin\">\n			<tbody>\n			  <tr>\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"1\"  checked id=\"showhide_dbaname\"/> </td>\n				<td> <label for=\"showhide_dbaname\" class=\"name\"> DBA Name </label> </td>\n			  </tr>\n			  <tr>\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"2\" checked id=\"showhide_state\" /> </td>\n				<td> <label for=\"showhide_state\" class=\"name\"> State </label> </td>\n			  </tr>\n			  <tr>\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"3\"  checked id=\"showhide_terminal\"/> </td>\n				<td> <label for=\"showhide_terminal\" class=\"name\"> Terminal </label> </td>\n			  </tr>\n			  <tr>\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"4\" checked id=\"showhide_authdate\"/> </td>\n				<td> <label for=\"showhide_authdate\" class=\"name\"> Auth Date </label> </td>\n			  </tr>\n			  <tr>\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"5\" checked id=\"showhide_cardtype\"/> </td>\n				<td> <label for=\"showhide_cardtype\" class=\"name\">  Card Type </label> </td>\n			  </tr>\n			   <tr>\n					<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"6\" checked id=\"showhide_cardno\"/> </td>\n					<td> <label for=\"showhide_cardno\" class=\"name\"> Card Number </label> </td>\n			  </tr>\n			  <tr>\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"7\" checked id=\"showhide_transtype\"/> </td>\n				<td> <label for=\"showhide_transtype\" class=\"name\"> Trans Type </label> </td>\n			  </tr>\n			   <tr>\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"8\" checked id=\"showhide_method\"/> </td>\n				<td> <label for=\"showhide_method\" class=\"name\"> Method </label> </td>\n			  </tr>\n			  <tr>\n				<td> <input type=\"checkbox\" class=\"no-margin toggle-vis\" data-column=\"9\" checked id=\"showhide_response\"/> </td>\n				<td> <label for=\"showhide_response\" class=\"name\">  Response </label> </td>\n			  </tr>\n			</tbody>\n		  </table>');
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
        $templateCache.put('partials/transactions/default.html', '<div ng-controller=\"transactionsCtrl\">\n\n    <!-- Sub Nav End -->\n	<div class=\"sub-nav <!--hidden-sm hidden-xs-->\">\n\n		<div class=\"col-xs-12 col-sm-4\">\n			<nav-hierarchy></nav-hierarchy>\n		</div>\n		<div class=\"col-xs-12 col-sm-3\">\n			<nav-date-range></nav-date-range>\n		</div>\n		\n		\n		<div class=\"col-xs-12 col-sm-4\">\n		\n			<button uib-popover-template=\"filterPopover.templateUrl\" popover-title=\"{{filterPopover.title}}\" popover-placement=\"bottom\" type=\"button\" class=\"btn btn-md btn-info\"><i class=\"fa fa-filter\"></i> Filters</button>\n\n			<button uib-popover-template=\"columnsPopover.templateUrl\" popover-title=\"{{columnsPopover.title}}\" popover-placement=\"bottom\" type=\"button\" class=\"btn btn-md btn-primary\"><i class=\"fa fa-eye-slash\"></i> Columns</button>\n\n			<button uib-popover-template=\"summarizePopover.templateUrl\" popover-title=\"{{summarizePopover.title}}\" popover-placement=\"bottom\" type=\"button\" class=\"btn btn-md btn-warning\"><i class=\"fa fa-sitemap\"></i> Summarize</button>\n\n			<button uib-popover-template=\"exportPopover.templateUrl\" popover-title=\"{{exportPopover.title}}\" popover-placement=\"bottom\" type=\"button\" class=\"btn btn-md btn-success\"><i class=\"fa fa-download\"></i> Export</button>\n \n		</div>   \n		  \n	</div>\n	<!-- Sub Nav End -->\n        \n        \n		\n	<!-- Wrapper Start -->\n	<div class=\"dashboard-wrapper-lg\">\n		<div class=\"view-container\">\n			  <div ui-grid=\"gridOptions\" class=\"grid\" ui-grid-infinite-scroll></div>\n		</div> \n	</div>\n	<!-- Wrapper End -->\n\n</div>\n');
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
        $templateCache.put('partials/transactions/export.html', '<div class=\"form-group\">\n	<button type=\"button\" class=\"btn btn-sm btn-success btn-search\" style=\"width:100%\"><i class=\"fa fa-file-excel-o\"></i> Export to Excel</button>\n</div>\n<div class=\"form-group\">\n	<button type=\"button\" class=\"btn btn-sm btn-info btn-search\" style=\"width:100%\"><i class=\"fa fa-file-text-o\"></i> Export to CSV</button>\n</div>');
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
        $templateCache.put('partials/transactions/filters.html', '<!--\n<div>{{filterPopover.content}}</div>\n<ul>\n	<li ng-repeat=\"item in filterPopover.items\">{{item.field}} {{item.checked}}</li>\n</ul>\n\n<div class=\"form-group\">\n  <label>Psssopup Title:</label>\n  <input type=\"text\" ng-model=\"filterPopover.title\" class=\"form-control\">\n</div>\n\n-->\n\n\n<table class=\"table table-condensed table-striped table-bordered table-hover no-margin\">\n	<tbody>\n	  <tr> \n		<td> <span class=\"name\">Batch</span> </td>\n		<td> <input type=\"text\" class=\"form-control input-xs\" name=\"search_batch\"> </td>\n	  </tr>\n	  <tr>\n		<td> <span class=\"name\">Type</span> </td>\n		<td> <select name=\"cardType\" class=\"form-control input-xs\">\n				<option value=\"A\"></option>\n				<option value=\"VISA\">VISA</option>\n				<option value=\"MAST\">MAST</option>\n				<option value=\"VYGR\">VYGR</option>\n				<option value=\"DINE\">DINE</option>\n				<option value=\"DSCV\">DSCV</option>\n				<option value=\"JCB\">JCB</option>\n				<option value=\"AEXP\">AEXP</option>\n				<option value=\"DISC\">DISC</option>\n				<option value=\"DSVR\">DSVR</option>\n				<option value=\"AMEX\">AMEX</option>\n			</select> </td>\n	  </tr>\n	  <tr>\n		<td> <span class=\"name\">Item No.</span> </td>\n		<td> <input type=\"text\" class=\"form-control input-xs\" name=\"search_itemno\"> </td>\n	  </tr>\n	  <tr>\n		<td> <span class=\"name\">Card No</span> </td>\n		<td> <input type=\"text\" class=\"form-control input-xs\" name=\"search_cardno\" maxlength=\"4\">  </td>\n	  </tr>\n	  <tr>\n		<td> <span class=\"name\">Terminal</span> </td>\n		<td> <input type=\"text\" class=\"form-control input-xs\" name=\"search_terminal\"> </td>\n	  </tr>\n	  \n	  <tr>\n		<td> <span class=\"name\">Amount Between</span> </td>\n		<td> <input type=\"text\" class=\"form-control input-xs\" name=\"search_amount_min\"> to <input type=\"text\" class=\"form-control input-xs\" name=\"search_amount_max\"> </td>\n	  </tr>\n	  \n	   <tr>\n		<td colspan=\"2\" align=\"center\">\n		 <button type=\"button\" class=\"btn btn-sm btn-primary btn-search\">Search</button>   </td>\n	  </tr>\n	</tbody> \n  </table>');
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
        $templateCache.put('partials/transactions/summarize.html', '<table class=\"table table-condensed table-striped table-bordered table-hover no-margin\">\n	<tbody>\n	  <tr>\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"1\"   id=\"showhide_dbaname\"/> </td>\n		<td> <label for=\"showhide_dbaname\" class=\"name\"> DBA Name </label> </td>\n	  </tr>\n	  <tr>\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"2\"  id=\"showhide_state\" /> </td>\n		<td> <label for=\"showhide_state\" class=\"name\"> State </label> </td>\n	  </tr>\n	  <tr>\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"3\"   id=\"showhide_terminal\"/> </td>\n		<td> <label for=\"showhide_terminal\" class=\"name\"> Terminal </label> </td>\n	  </tr>\n	  <tr>\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"4\"  id=\"showhide_authdate\"/> </td>\n		<td> <label for=\"showhide_authdate\" class=\"name\"> Auth Date </label> </td>\n	  </tr>\n	  <tr>\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"5\"  id=\"showhide_cardtype\"/> </td>\n		<td> <label for=\"showhide_cardtype\" class=\"name\">  Card Type </label> </td>\n	  </tr>\n	   <tr>\n			<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"6\"  id=\"showhide_cardno\"/> </td>\n			<td> <label for=\"showhide_cardno\" class=\"name\"> Card Number </label> </td>\n	  </tr>\n	  <tr>\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"7\"  id=\"showhide_transtype\"/> </td>\n		<td> <label for=\"showhide_transtype\" class=\"name\"> Trans Type </label> </td>\n	  </tr>\n	   <tr>\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"8\"  id=\"showhide_method\"/> </td>\n		<td> <label for=\"showhide_method\" class=\"name\"> Method </label> </td>\n	  </tr>\n	  <tr>\n		<td> <input type=\"checkbox\" class=\"no-margin summarize-by\" data-column=\"9\"  id=\"showhide_response\"/> </td>\n		<td> <label for=\"showhide_response\" class=\"name\">  Response </label> </td>\n	  </tr>\n	</tbody>\n</table>');
    }]);
})();

//# sourceMappingURL=templates.js.map