<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Perkz</title>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,800italic,400,600,800" type="text/css">
<link rel="stylesheet" href="http://sptdev2.webqa.sterlingpayment.com//assets/css/font-awesome.min.css" type="text/css" />		
<link rel="stylesheet" href="http://sptdev2.webqa.sterlingpayment.com//assets/css/bootstrap.min.css" type="text/css" />	
<link rel="stylesheet" href="http://sptdev2.webqa.sterlingpayment.com//assets/js/libs/css/ui-lightness/jquery-ui-1.9.2.custom.css" type="text/css" />
<link rel="stylesheet" href="http://sptdev2.webqa.sterlingpayment.com//assets/js/plugins/icheck/skins/minimal/blue.css" type="text/css" />
<link rel="stylesheet" href="http://sptdev2.webqa.sterlingpayment.com//assets/js/plugins/select2/select2.css" type="text/css" />
<link rel="stylesheet" href="http://sptdev2.webqa.sterlingpayment.com//assets/js/plugins/fullcalendar/fullcalendar.css" type="text/css" />
<link rel="stylesheet" href="http://sptdev2.webqa.sterlingpayment.com//assets/css/App.css" type="text/css" />
<link rel="stylesheet" href="http://sptdev2.webqa.sterlingpayment.com//assets/css/custom.css" type="text/css" />	


<script src="http://sptdev2.webqa.sterlingpayment.com//assets/js/libs/jquery-1.9.1.min.js"></script>
<script src="http://sptdev2.webqa.sterlingpayment.com//assets/js/libs/jquery-ui-1.9.2.custom.min.js"></script>
<script src="http://sptdev2.webqa.sterlingpayment.com//assets/js/libs/bootstrap.min.js"></script>
<script src="http://sptdev2.webqa.sterlingpayment.com//assets/js/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="http://sptdev2.webqa.sterlingpayment.com//assets/js/plugins/datatables/DT_bootstrap.js"></script>
<script src="http://sptdev2.webqa.sterlingpayment.com//assets/js/plugins/tableCheckable/jquery.tableCheckable.js"></script>
<script src="http://sptdev2.webqa.sterlingpayment.com//assets/js/App.js"></script>
<script src="http://sptdev2.webqa.sterlingpayment.com//assets/js/plugins/icheck/jquery.icheck.min.js"></script>

<style>
.dataTables_processing {
	position: absolute;
	right: 10px;
	margin-top: -24px;
}
.dataTables_info {
	margin-left: 10px;
}
</style>

</head>
<body>

 
<input type="text" name="entityIDlist" id="entityIDlist" value="1" class="extraInputs">
<input type="text" name="keywords" id="keywords" value="John" class="extraInputs">

<div class="table-responsive">
							
<table cellpadding="0" cellspacing="0" border="0" class="display table table-striped table-bordered table-hover table-highlight table-checkable" id="displayData"> 
    <thead>
        <tr>
            <th class="ENTITYNAME">ENTITYNAME</th>
         	<th class="MOBILEPHONE">MOBILEPHONE</th>
            <th class="EMAILADDRESS">EMAILADDRESS</th>
            <th class="CREATEDDATE">CREATEDDATE</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="5" class="dataTables_empty">Loading data from server</td> 
        </tr>
    </tbody>
</table>

</div>


<script type="text/javascript" charset="utf-8">



$(document).ready(function() {

	$.fn.phoneFormat = function() {
		var val = '';
		if(this[0]) {
			var phone = this[0].toString();
			val =  '(' + phone.substr(0, 3) + ') ' + phone.substr(3, 3) + '-' + phone.substr(6,4);
		}
		
		return val;
	};



	oTable =  $('#displayData').dataTable( {
    "sAjaxSource" : "handler.cfm"
    ,"bProcessing": true
    ,"bStateSave": true
    ,"bServerSide": true
    ,"bFilter" : true
    ,"sDom": '<"top"ir>t<"bottom"lp><"clear">'
   	,"aaSorting": [[1,'asc']]
	,"oLanguage": {
				"sLengthMenu": "Rows: _MENU_"
				,"sZeroRecords": "No members found."
				}
    ,"aoColumnDefs":
    	[{
    		"aTargets": [ "ENTITYNAME" ]
		  	,"sTitle":"Member Name"
		  	,"sWidth" : "25%"
		  	,"bSortable": true
		  	,"mRender": function ( value, type, full )  {
			  return  (value == '') 
                    ? 'Name not supplied'
                    : value ;
			  }
	  },{
	  		"aTargets": [ "MOBILEPHONE" ]
			,"sTitle":"Telephone"
		  	,"sWidth": "25%"
		  	,"bSortable": true
		  	,"mRender": function ( value, type, full )  {
			  return  (value == '8885551212') 
                    ? 'No phone number'
                    : $(value).phoneFormat() ;
			  }
	  },{
	  		"aTargets": [ "EMAILADDRESS" ]
		  	,"sTitle":"Email Address"
		  	,"sWidth": "25%"
		  	,"bSortable": true
		  	,"mRender": function ( value, type, full )  {
			  return  (value == 'none@none.com' || value == '' || value == null) 
                    ? 'No email address'
                    : value ;
			  }
	  },{
	  		"aTargets":[ "CREATEDDATE" ]
		  	,"sTitle":"Joined"
		  	,"sType": "date"
		  	,"sWidth": "25%"
		  	,"bSortable": true
		  	,"mRender": function(date, type, full) {
          			return date;
          			//return  Date(date).toDateString();
                   }
      }]
  
  	
    ,'fnStateSave' : function(settings,data){
						localStorage.setItem("dataTables_state", JSON.stringify(data));
					  }
    ,'fnStateLoad': function(settings) {
						return JSON.parse(localStorage.getItem("dataTables_state"));
					  }
    , "fnServerData": function ( sSource, aoData, fnCallback ) {

						aoData.push(
							{ "name": "entityIDlist", "value": $('#entityIDlist').val() },
							{ "name": "keywords", "value": $('#keywords').val() },
							{ "name": "columnsInOrder", "value": "entityName,mobilePhone,EMAILADDRESS,CREATEDDATE" }
						);

						$.ajax( {"dataType": 'json',
								 "type": "POST",
								 "url": sSource,
								 "data": aoData,
								 "success": fnCallback} );
						}  
      
      
	});
	

	$('.extraInputs').change(function () {
        oTable.fnDraw();
    });
    
    $('.extraInputs').keyup(function () {
        oTable.fnDraw();
    });
    
	
});
</script>                    
                                
        
                                
</body>
</html>



