<cfparam name="attributes.columnlist" default="MEMBERID:,ENTITYNAME:Member Name,MOBILEPHONE:Mobile Phone,EMAILADDRESS:Email Address,PARENTPROGRAM:Program,CREATEDDATE:Joined">
<cfparam name="attributes.feedurl" default="">
<cfparam name="attributes.columnclasses" default="">
<cfparam name="attributes.entitytype" default="">
<cfparam name="attributes.sendFields" default="entitytypeid,entityIDlist,excludeEntityIDlist,keywords,birthdaydays,AnniversaryDays,ActivityDayRange">
<cfparam name="attributes.editurl" default="">
<cfparam name="attributes.previewurl" default="">
<cfparam name="attributes.duplicateurl" default="organization.duplicate">
<cfparam name="attributes.rolegroup" default="organization">
<cfparam name="attributes.rolesection" default="edit_#replace(lcase(attributes.entityType), " ", "_", "ALL")#s">
					  
<cfset tableName = "displayData_#ListFirst(caller.rc.action, ".")#">

<cfif attributes.feedurl IS "">
	<h2>feedurl is a required paramter</h2>
	<cfexit>
</cfif>


<input type="hidden" value="" name="filter_SELECTEDMEMBERIDLIST" id="filter_SELECTEDMEMBERIDLIST">     


<cfset columnListNameOnly = "">       


<cfoutput>

<div class="table-responsive col-sm-12">		
					
<table cellpadding="0" cellspacing="0" border="0" class="display table table-striped table-bordered table-hover table-highlight" id="#tableName#"> 
    <thead>
 <cfset columns = 0>
 
		<cfloop list="#attributes.columnlist#" index="field">
			<cfif listLen(field, ":") GT 1> 
				<cfset columns++ >
				<th class="#listFirst(field, ":")#<cfif right(listFirst(field, ":"),2) IS "ID"> checkbox-column</cfif>">#listFirst(field, ":")#</th>
			</cfif>
		</cfloop>
			<cfif attributes.editurl IS NOT "">
			<th class="EDIT"></th>
			</cfif>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="#columns+1#" class="dataTables_empty">Loading data from server</td> 
        </tr>
    </tbody>
</table>

<div class="clearfix">&nbsp;</div>

</div>



</cfoutput>



<cfset caller.rc.js_libs = listAppend(caller.rc.js_libs, ",/assets/js/plugins/datatables/jquery.dataTables.min.js,/assets/js/plugins/datatables/DT_bootstrap.js,/assets/js/plugins/tableCheckable/jquery.tableCheckable.js,/assets/js/plugins/ellipsis/jquery.ellipsis.min.js")>



<cfsavecontent variable="caller.rc.jquery">
<cfoutput>		

#caller.rc.jquery#

	$.fn.phoneFormat = function(val) {
		
		if(val) {
			var phone = val;
			val =  '(' + phone.substr(0, 3) + ') ' + phone.substr(3, 3) + '-' + phone.substr(6,4);
		}	
		return val;
	};
	

	var selArray = getSelectedArray();
				


	oTable =  $('###tableName#').dataTable( {
    "sAjaxSource" : "#attributes.feedurl#"
    ,"bProcessing": true
    ,"bStateSave": true
    ,"bServerSide": true
    ,"bFilter" : true
    ,"sPageFirst": "First"
    ,"sPageLast": "Last"
    ,"bAutoWidth": false
    ,"sDom": '<"top"lp>t<"bottom"ri><"clear">'
   	,"aaSorting": []
	,"oLanguage": {
				"sLengthMenu": "Rows: _MENU_"
				,"sZeroRecords": "No records found."
				}
    ,"aoColumnDefs":
    
    	[

	    	
    		<cfloop list="#attributes.columnlist#" index="field">
    			<cfset columnListNameOnly = listAppend(columnListNameOnly, listFirst(field, ":"))>
    			<cfset colNumber = listFind(attributes.columnlist, field)>
    			
    			<cfif listLast(field, ":") IS "_">
    			{
					'mData': 0
					,"sWidth": '30px'
					,"aTargets": [ "#listFirst(field, ":")#" ]
					,"bSortable": false
					,"sTitle": '<input type="checkbox" class="icheck-input icheck-input-header" name="#listFirst(field, ":")#">'
					,"mRender": function ( value, type, full )  {  
						return '<input type="checkbox" class="icheck-input icheck-input-children" value="'+value+'" '+($.inArray(value,selArray) >= 0 ? 'checked="checked"' : '') +' name="#listFirst(field, ":")#">';
						}
				}
			
				<cfelseif ListLen(field, ":") GT 1>
					<cfif field IS NOT listFirst(attributes.columnlist)>,</cfif> 
					{
					"aTargets": [ "#listFirst(field, ":")#" ]
					,"sTitle":"#listLast(field, ":")#"
					,"bSortable": true
					
					<cfif listLen(attributes.columnclasses) GTE colNumber>
					,"sClass": "#ListGetAt(attributes.columnclasses, colNumber)#"
					</cfif>
					
					<cfif listFirst(field, ":") eq "OFFERINCLUDEDIND">
					
					,"mRender": function ( value, type, full )  {
						return  (value == 'Y') 
							? '<i class="fa fa-gift"></i>'
							: '' ;  	
							}		
					<cfelseif listFirst(field, ":") contains "count">
					,"mRender": function ( value, type, full )  {
						return value ; 
							} 
					<cfelseif listFirst(field, ":") contains "entity">
					,"mRender": function ( value, type, full )  {
							return value ; 
							}				
					<cfelseif listFirst(field, ":") contains "phone">  
					 ,"mRender": function ( value, type, full )  {
					   	return  (value == '8885551212' || value == '8135551212'  || value == ''  || value == null) 
							? 'No phone number'
							: $().phoneFormat(value) ;
							}
					<cfelseif listFirst(field, ":") contains "email">  
					,"mRender": function ( value, type, full )  {
						return  (value == 'none@none.com' || value == '' || value == null) 
							? 'No email address'
							: value ;
							}
					<cfelseif listFirst(field, ":") contains "date">  
					,"mRender": function ( value, type, full )  {
						return (value == '' || value == null || value == 'null') 
							? ''
							: new Date($.prettyDate.parse(value.replace(" ","T"))).toDateString();
							}
					<cfelse>
					,"mRender": function ( value, type, full )  {
						return value;
						}
					</cfif> 
					 
			  }
			  
			  </cfif>
	        </cfloop>
	        
	        		,{
				 	'mData': 0
					,"aTargets": [ "EDIT" ]
					,"bSortable": false
					,"sTitle": ''
					,"sClass": 'nowrap'
					,"sWidth": '50px'
					,"mRender": function ( value, type, full )  {  
						var editable = #ListFindNoCase(attributes.columnlist, "EditableIND")-1#;
						var duplicatable = #ListFindNoCase(attributes.columnlist, "DuplicatableIND")-1#;
						var returnString = '';
						
						
						<cfif attributes.entitytype IS "Campaign" >
					   		returnString += '<button type="button" class="btn btn-info btn-xs preview-btn" modal_title="Preview Campaign" preview_value="'+value+'"><i class="fa fa-eye"></i></button> '
					  	</cfif>
					  
					  
					  <cfif attributes.entitytype IS "help">
					   		returnString += '<button type="button" class="btn btn-info btn-xs preview-btn" modal_title="Loyalty Help" preview_value="'+value+'"><i class="fa fa-eye"></i></button> '
					  	</cfif>
					  
					  
					  
					  
					  <cfif ListFindNoCase(attributes.columnlist, "EditableIND") GT 0 and IsUserInRole("#attributes.rolegroup#:#attributes.rolesection#")>
			
					  
						if(editable > 0) {
					   		if(full[editable] == 'Y'){
					   	  	 returnString += '<button type="button" class="btn btn-success btn-xs edit-btn" edit_value="'+value+'">Edit</button> '
					   	  	}
					   	}  	
					  
					  	if(duplicatable > 0) {
					   		if(full[duplicatable] == 'Y'){
					   	  	 returnString += '<button type="button" class="btn btn-tertiary btn-xs duplicate-btn" duplicate_value="'+value+'">Dupe</button> '
					   	  	}
					   	}
					   	
					   	</cfif>
					   	
					   
						 <cfif IsDefined("attributes.entitytypeid")>
						 
						 <cfif attributes.entitytypeid LTE 1>
						 
						 returnString += '<button type="button" class="btn btn-info btn-xs children-btn" url="/?action=organization.salesorganizations&lockToEntityid='+value+'" rel="tooltip" title="Sales Organizations"><i class="fa fa-sitemap"></i></button> '
						 </cfif>
						 
						 <cfif attributes.entitytypeid LT 4>
						 returnString += '<button type="button" class="btn btn-info btn-xs children-btn" url="/?action=organization.corporations&lockToEntityid='+value+'" rel="tooltip" title="Corporations"><i class="fa fa-umbrella"></i></button> '
						 </cfif>
						 
						 <cfif attributes.entitytypeid LT 5>
						 returnString += '<button type="button" class="btn btn-info btn-xs children-btn" url="/?action=organization.programs&lockToEntityid='+value+'" rel="tooltip" title="Programs"><i class="fa fa-tag"></i></button> '
						 </cfif>
						 
						 <cfif attributes.entitytypeid LT 6>
						 returnString += '<button type="button" class="btn btn-info btn-xs children-btn" url="/?action=organization.locations&lockToEntityid='+value+'" rel="tooltip" title="Locations"><i class="fa fa-shopping-cart"></i></button> '
						 </cfif>
						 
						 <cfif attributes.entitytypeid LT 7>
						 returnString += '<button type="button" class="btn btn-info btn-xs children-btn" url="/?action=organization.groups&lockToEntityid='+value+'" rel="tooltip" title="Groups"><i class="fa fa-group"></i></button> '
						 </cfif>
						 
						 <cfif attributes.entitytypeid LT 10>
						 returnString += '<button type="button" class="btn btn-info btn-xs children-btn" url="/?action=organization.members&lockToEntityid='+value+'" rel="tooltip" title="Members"><i class="fa fa-user"></i></button> '
						 </cfif>
						 
						
						</cfif>
						
					  
					  	
					   	return returnString;
					   	}
					}
					
	        
        ]
    ,'fnStateSave' : function(settings,data){
    					totalRecords = settings._iRecordsTotal;
						localStorage.setItem("#tableName#_state", JSON.stringify(data));
					  }
    ,'fnStateLoad': function(settings) {
						return JSON.parse(localStorage.getItem("dataTables_state"));
					  }
    , "fnServerData": function ( sSource, aoData, fnCallback ) {
						aoData.push(
							{ "name": "columnsInOrder", "value": "#columnListNameOnly#" }
							<cfloop list="#attributes.sendFields#" index="f">
							, { "name": "#f#", "value": $('##filter_#ucase(f)#').val() }
							</cfloop>
						);

						$.ajax( {"dataType": 'json', "type": "POST", "url": sSource, "data": aoData, "success": fnCallback, "cache": false} );
						}  
	,"fnDrawCallback": function( oSettings ) {
						selArray = getSelectedArray();
						$('.icheck-input-header').attr("checked", false);
						  
						$('.edit-btn').on("click", function(e){
							editEntity($(this).attr("edit_value"));
						});
						
						$('.duplicate-btn').on("click", function(e){
							duplicateEntity($(this).attr("duplicate_value"));
						});  
						
						$('.preview-btn').on("click", function(e){
							previewItem($(this).attr("preview_value"), $(this).attr("modal_title"));
						});  
						
						$('.children-btn').on("click", function(e){
							childrenLink($(this).attr("url"));
						});  
						
						
						$('.icheck-input-children').on("change", function(e){
							if($(this).prop('checked')) {
								storeChecked($(this).val());
							} else {
								removeChecked($(this).val());
							}
						}); 
						  
		}	
						
	, "fnCreatedRow": function( nRow, aData, iDataIndex ) {
	
			$(nRow).children("td:nth-child(2)").addClass('ellipsis-lg');
			$(nRow).children("td:nth-child(3)").addClass('ellipsis-md');

        }
        
    ,"fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
          $('td:eq(0)', nRow).addClass( "checkbox-column" );
        }    									 
	});
	
	
	<cfif listFind(attributes.sendFields, "keywords")>
    $('##filter_KEYWORDS').on("keyup", function(e) {
    	if($(this).val().trim() == '' && keywords != '') {
    		reloadTable();
    	} else if($(this).val().trim().length >= 2) {
	        typingTimer = setTimeout(reloadTable, doneTypingInterval);
	        
		} 
		keywords = $(this).val().trim();
		$saveState();
	});
    
    
    $('##filter_KEYWORDS').on("keydown", function(e) {
        clearTimeout(typingTimer);
	});
    </cfif>
    
    <cfif listFind(attributes.sendFields, "entityIDlist")>
    $('##filter_ENTITYIDLIST').on("change", function(e) {
       reloadTable();
	});
    </cfif>
    
    <cfif listFind(attributes.sendFields, "excludeEntityIDlist")>
     $('##filter_EXCLUDEENTITYIDLIST').on("change", function(e) {
        reloadTable();
	});
	</cfif>
      
    <cfif listFind(attributes.sendFields, "birthdaydays")>    
    $('##filter_BIRTHDAYDAYS').on("change", function(e) {
    	BirthdayDays = $(this).val();
    	$saveState();
        reloadTable();
	});
	</cfif>
    
    <cfif listFind(attributes.sendFields, "AnniversaryDays")>
    $('##filter_ANNIVERSARYDAYS').on("change", function(e) {
  	  	AnniversaryDays = $(this).val();
    	$saveState();
        reloadTable();
	});
    </cfif>
    
    <cfif listFind(attributes.sendFields, "ActivityDayRange")>
    $('##filter_ACTIVITYDAYRANGE').on("change", function(e) {
        ActivityDayRange = $(this).val(); 
    	$saveState();
        reloadTable();
	});
   </cfif>
   
   <cfif listFind(attributes.sendFields, "endDate")>
    $('##filter_ENDDATE').on("change", function(e) {
        endDate = $(this).val(); 
    	$saveState();
        reloadTable();
	});
   </cfif>
   
   <cfif listFind(attributes.sendFields, "startDate")>
    $('##filter_STARTDATE').on("change", function(e) {
        startDate = $(this).val(); 
    	$saveState();
        reloadTable();
	});
   </cfif>
   
   
     
   
   	function getSelectedArray() {
		return $.map($('##filter_SELECTEDMEMBERIDLIST').val().split(','), function(value){
			return parseInt(value, 10);
			});
	}
	
	
	function reloadTable () {
		 oTable.fnDraw(false);
		 $saveState();
	}
	
	function editEntity(id) {
		location.href='#attributes.editurl#'+id;
	}
	
	function duplicateEntity(id) {
		if(confirm('Are you sure you want to duplicate this entity?')) {
				$.ajax({ url:"#attributes.duplicateurl#"
						,success: function(result){
							resync();
							reloadTable();
							}
						,fail: function(result){
							alert(result);
							}
						,data: {
								"id": id
							}
						,type: "POST"	
					  });
		}
	}
	
	function previewItem(id, modal_title) {
			$.ajax({ url:"#attributes.previewurl#"
					,success: function(result){
							$('##previewMessageDiv').html(result);
						
						}
					,fail: function(result){
						alert(result);
						}
					,data: {
							"id": id
						}
					,type: "POST"	
				  });
			
			$('##PREVIEWMODAL_title').html(modal_title);
			$('##PREVIEWMODAL').modal({show: 'true', keyboard: 'false', backdrop: 'static'});		
		
	}



	function childrenLink(url) {
		location.href=url;
	}
		

	
	
	
	

	function storeChecked(value) {
		var input = $( "##filter_SELECTEDMEMBERIDLIST" );
		if(input.val()=='') { input.val(value); }
		else { 
			removeChecked(value);
			input.val(input.val() + "," + value ); 
		}
		selectedMemberIDlist = input.val();
		$saveState();
    }
    
	function removeChecked(value) {
		var iArray = $.grep(getSelectedArray(), function(v) {
		  return v != value;
		});
		
		var iString = iArray.join()
 	    $('##filter_SELECTEDMEMBERIDLIST').val(iString);
          selectedMemberIDlist = iString;
          $saveState();
    }    


 	$('.icheck-input-header').on("change", function(e){
 		$('###tableName# tbody input[type="checkbox"]').prop('checked', this.checked);
 		$('###tableName# tbody input[type="checkbox"]').trigger('change');
    }); 
    
    
    function clearAllChecked(value) {
    	var iString = '';
 	    $('##filter_SELECTEDMEMBERIDLIST').val(iString);
          selectedMemberIDlist = iString;
          $saveState();
    }   
    
    
 
     
</cfoutput>		

</cfsavecontent>



