<!---  ORIGINAL --->

<cfparam name="attributes.addurl" default="">
<cfparam name="attributes.deleteurl" default="">
<cfparam name="attributes.sendurl" default="">
<cfparam name="attributes.moveurl" default="">
<cfparam name="attributes.entityType" default="">
<cfparam name="attributes.entitytypeid" default="10">
<cfparam name="attributes.rolegroup" default="organization">
<cfparam name="attributes.rolesection" default="willfail">
	
<cfparam name="attributes.sendFields" default="entitytypeid,entityIDlist,excludeEntityIDlist,keywords,BirthdayDays,AnniversaryDays,ActivityDayRange">

<cfset attributes.entityType = replace(attributes.entityType, " ", "_", "ALL")>

<cfoutput>	       



<div class="col-sm-12">

	<a href="javascript:;" helpsection="#caller.rc.action#" class="helpBtn pull-right"><i class="fa fa-question-circle"></i></a>
	
	<cfif  attributes.rolesection IS NOT "sales_organizations">
	
	<cfif attributes.moveurl is not "" and (IsUserInRole("#attributes.rolegroup#:move_#lcase(attributes.entityType)#s") or IsUserInRole("#attributes.rolegroup#:#attributes.rolesection#"))>
		<button class="btn btn-warning btn-xs text-center" id="btnMove">Move Selected</button>
	</cfif>
	
	</cfif>
	
	<cfif attributes.deleteurl is not "" and IsUserInRole("#attributes.rolegroup#:delete_#lcase(attributes.entityType)#s")  or IsUserInRole("#attributes.rolegroup#:#attributes.rolesection#")><button class="btn btn-danger btn-xs text-center" id="btnDelete">Delete Selected</button></cfif>

	<cfif attributes.addurl is not "" and IsUserInRole("#attributes.rolegroup#:add_#lcase(attributes.entityType)#s")  or IsUserInRole("#attributes.rolegroup#:#attributes.rolesection#")><button class="btn btn-primary btn-xs text-center" id="btnAdd">Add New #replace(attributes.entityType, "_", " ", "ALL")#</button></cfif>
	
	<cfif attributes.sendurl is not "" and IsUserInRole("#attributes.rolegroup#:send_message") ><button class="btn btn-info btn-xs text-center" id="btnSend">Send Message</button></cfif>
	
	

	
	
</div>

<cfif attributes.moveurl is not "">
<cfset caller.rc.modal.moveModal.header="Move Selected">
<cfsavecontent variable="caller.rc.modal.moveModal.body">

	<div class="alert alert-warning modal_target" id="modal_target"></div>


	<p id="modalmessage">Select the entity that you would like to move the select items to:</p>
	<select name="move" id="move" class="form-control select2-input input-sm" data-required="true">
		<option value="">Move to...</option>
	</select>  
</cfsavecontent>	
<cfsavecontent variable="caller.rc.modal.moveModal.footer">
	<button type="button" class="btn btn-tertiary" data-dismiss="modal" id="btnMoveClose">Close</button>
	<button type="button" class="btn btn-primary" id="btnMoveAction">Move</button>
</cfsavecontent>	
</cfif>					
					

<cfif attributes.addurl is not "">
<cfset caller.rc.modal.addModal.header="Add #replace(attributes.entityType, "_", " ", "all")#">
<cfsavecontent variable="caller.rc.modal.addModal.body">

	<div class="alert alert-warning modal_target" id="modal_target"></div>

	<p id="modalmessage">Select the entity that you would like to add a #attributes.entityType# to:</p>
	<select name="add" id="add" class="form-control select2-input input-sm" data-required="true">
		<option value="">Add to...</option>
	</select>  
	
</cfsavecontent>	
<cfsavecontent variable="caller.rc.modal.addModal.footer">
	<button type="button" class="btn btn-tertiary" data-dismiss="modal">Close</button>
	<button type="button" class="btn btn-primary" id="btnAddAction">Next</button>
</cfsavecontent>	
</cfif>					
					
						
			
					
<cfif attributes.sendurl is not "">



<cfset caller.rc.modal.sendModal.header="Send Message to #attributes.entityType#">
<cfsavecontent variable="caller.rc.modal.sendModal.body">

	<div class="alert alert-warning modal_target" id="modal_target"></div>

	<p>Select the message/offer you want to send:</p>
	<select name="sendCampaignID" id="sendCampaignID" class="form-control select2-input input-sm" data-required="true">
	</select>  
	<p></p>
	
	<p>Send to:</p>
	<select name="sendTo" id="sendTo" class="form-control select2-input input-sm" data-required="true">
		<option value="">Send to...</option>
	</select>  
	<p></p>
	
	<p>Bill messaging charges to:</p>
	<select name="billingEntityID" id="billingEntityID" class="form-control select2-input input-sm" data-required="true">
		<option value="">Bill to...</option>
	</select>  
	<p></p>
	
	<p>Schedule to send after:</p>
	
	<div class="row">
  	<div class="col-xs-6">
		<div class="input-group date ui-datepicker">
			<input id="sendAfterDate" name="sendAfterDate" class="form-control" type="text" parsley-trigger="focusout" parsley-americandate="true">
			<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
		</div>
    </div>
    <div class="col-xs-6">                
		<div class="input-group bootstrap-timepicker time">
			<input id="sendAfterTime" name="sendAfterTime" type="text" class="form-control ui-timepicker">
			<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
		</div>
   </div>                   
	</div>
</cfsavecontent>	
<cfsavecontent variable="caller.rc.modal.sendModal.footer">
	<button type="button" class="btn btn-tertiary" data-dismiss="modal" id="btnSendClose">Cancel</button>
	<button type="button" class="btn btn-secondary" id="btnSendPreview">Preview Message</button>
	<button type="button" class="btn btn-primary" id="btnSendAction">Send Message</button>
</cfsavecontent>	

	

</cfif>					
		
	
					
<cfif attributes.deleteurl is not "">
<cfset caller.rc.modal.deleteModal.header="Delete #attributes.entityType#">
<cfsavecontent variable="caller.rc.modal.deleteModal.body">

	<div class="alert alert-warning modal_target" id="modal_target"></div>


	<p id="deleteMsg">Are you sure you want to delete the selected #attributes.entityType#?</p>
</cfsavecontent>	
<cfsavecontent variable="caller.rc.modal.deleteModal.footer">
	<button type="button" class="btn btn-tertiary" data-dismiss="modal">Close</button>
	<button type="button" class="btn btn-primary" id="btnDeleteAction">Delete #replace(attributes.entityType, "_", " ", "ALL")#(s)</button>
</cfsavecontent>	
</cfif>					
							
											
			
						

<cfset caller.rc.js_libs = listPrepend(caller.rc.js_libs, "/assets/js/plugins/select2/select2.min.js,/assets/js/plugins/magnific/jquery.magnific-popup.min.js,/assets/js/plugins/datepicker/bootstrap-datepicker.js,/assets/js/plugins/timepicker/bootstrap-timepicker.js")>

<cfset caller.rc.css_libs = listPrepend(caller.rc.css_libs, "/assets/js/plugins/magnific/magnific-popup.css,/assets/js/plugins/select2/select2.css,/assets/js/plugins/timepicker/bootstrap-timepicker.css,/assets/js/plugins/datepicker/datepicker.css")>

</cfoutput>	

<cfsavecontent variable="caller.rc.jquery">
<cfoutput>		

#caller.rc.jquery#


var totalChildren = 0;

var timer;

for(j in hOrdered){ 
	if( (parseInt(hOrdered[j].ENTITYTYPEID) < #attributes.entitytypeid# 
		&& parseInt(hOrdered[j].ENTITYTYPEID) < 8 
		&& parseInt(hOrdered[j].ENTITYTYPEID) > 1)
		||
		parseInt(hOrdered[j].ENTITYTYPEID) == 2 && #attributes.entitytypeid# == 2 
		) {
	var option = $("<option></option>")
		.attr("value", hOrdered[j].ENTITYID)
		.attr("etype",hOrdered[j].ENTITYTYPENAME)
		.attr("class","tab"+hOrdered[j].ENTITYLEVEL + " " +hOrdered[j].ENTITYTYPENAME)
		.text(hOrdered[j].ENTITYNAME);  
		
	
	var option2 = $("<option></option>")
		.attr("value", hOrdered[j].ENTITYID)
		.attr("etype",hOrdered[j].ENTITYTYPENAME)
		.attr("class","tab"+hOrdered[j].ENTITYLEVEL + " " +hOrdered[j].ENTITYTYPENAME)
		.text(hOrdered[j].ENTITYNAME); 
		
	var option3 = $("<option></option>")
		.attr("value", hOrdered[j].ENTITYID)
		.attr("etype",hOrdered[j].ENTITYTYPENAME)
		.attr("class","tab"+hOrdered[j].ENTITYLEVEL + " " +hOrdered[j].ENTITYTYPENAME)
		.text(hOrdered[j].ENTITYNAME); 	 
		
	if( '#attributes.entitytypeid#' === '10' && parseInt(hOrdered[j].ENTITYTYPEID) < 6 ) {
		option.attr("disabled","true");
		option2.attr("disabled","true");
	} else if( '#attributes.entitytypeid#' === '11' && parseInt(hOrdered[j].ENTITYTYPEID) < 4 ) {
		option.attr("disabled","true");
		option2.attr("disabled","true");
	}
	 else if( '#attributes.entitytypeid#' === '7' && parseInt(hOrdered[j].ENTITYTYPEID) < 6 ) {
		option.attr("disabled","true");
		option2.attr("disabled","true");
	} else if( '#attributes.entitytypeid#' === '6' && parseInt(hOrdered[j].ENTITYTYPEID) != 5 ) {
		option.attr("disabled","true");
		option2.attr("disabled","true");
	} else if( '#attributes.entitytypeid#' === '5' && parseInt(hOrdered[j].ENTITYTYPEID) != 4 ) {
		option.attr("disabled","true");
		option2.attr("disabled","true");
	}		
		
	
		
	$("##move").append(option);
	$("##add").append(option2);
	$("##billingEntityID").append(option3);
	
	totalChildren++;
	
	}
} 






<cfif attributes.moveurl is not "">

if(totalChildren == 0){
	$('##btnMove').hide();
} else {

	$('##btnMove').on("click", function(e) {
		e.preventDefault(); 
		$('.modal_target').hide();

		if($('##filter_SELECTEDMEMBERIDLIST').val() == '') {
			alert('You must select at least one item to move.');

		} else {
			var selectedCount = $('##filter_SELECTEDMEMBERIDLIST').val().split(',').length;
			$('##modalmessage').html('Select the new parent entity for the ' + selectedCount + ' selected #attributes.entityType#' + ((selectedCount > 1) ? 's' : ''));
		
			$('##btnMoveAction').off('click');
			$('##btnMoveAction').on("click", function(e) { 
				if($('##move option:selected').val() == '') {
					alert('You must select a new parent entity');
				} else {
					$(document).off('keyup');
					$.ajax({ url:"#attributes.moveurl#"
						,success: function(result){
						
								var jResult = $.parseJSON(result);
							
								if(jResult[0].ENTITYID > 0 || jResult[0].ERRORCODE == '000') {
									showAlert('.modal_target', 'success', '#attributes.entityType# successfully moved.');
									resync();
									reloadTable();
									$('##btnMoveAction').hide();
									timer = setTimeout(function(){ $('##MOVEMODAL').modal('hide') } , 4000);
									clearAllChecked();
								} else {					
									showAlert('.modal_target', 'danger', jResult[0].ERRORMESSAGE);
								}
							
							}
						,fail: function(result){
							alert(result);
							}
						,data: {
								"ids": $('##filter_SELECTEDMEMBERIDLIST').val()
								,"newparent":$('##move option:selected').val()
							}
						,type: "POST"	
					  });
				}

			});
			
			$('##btnMoveClose').off("click");
			$('##btnMoveClose').on("click", function(e) { 
				clearTimeout(timer);
			});
		
			$('##MOVEMODAL').modal('show');
			$('##btnMoveAction').show();
		
			$(document).keydown(function(e) {
				if (e.keyCode == 27) { 
					$('##MOVEMODAL').modal('hide'); 
					$(document).off('keyup');
				} 
			});
		
		
		} 	
	});

}

</cfif>


<cfif attributes.sendurl is not "">


$('##btnSend').on("click", function(e) {
	e.preventDefault(); 
	$('.modal_target').hide();
	$('##btnSendAction').show();
	$('##btnSendPreview').show();
	$('##btnSendClose').html("Cancel");

	$.ajax({ url:"/?action=organization.campaigns"
		,success: function(result){
			
			var campaigns = $.parseJSON(result);

			$('##sendCampaignID').empty();	
				for(c in campaigns){ 
					if(campaigns[c].CAMPAIGNID != undefined) {
						var option = $("<option></option>")
						.attr("value", campaigns[c].CAMPAIGNID)
						.attr("etype",campaigns[c].ENTITYTYPENAME)
						.attr("class","tab"+campaigns[c].ENTITYLEVEL + " " +campaigns[c].TYPENAME)
						.text(campaigns[c].ENTITYNAME + ': ' + campaigns[c].CAMPAIGNNAME);  
						$("##sendCampaignID").append(option);
						}
					}
					
					$('##sendCampaignID').select2({placeholder: "Campaign",formatResult: formatOptions,formatSelection: formatOptions});
					

			}
		,fail: function(result){
			alert(result);
			}
		,data: {
				"ids": $('##filter_ENTITYIDLIST').val()
				
				<cfloop list="#attributes.sendFields#" index="f">
				, "#f#": $('##filter_#ucase(f)#').val() 
				</cfloop>
							
			}
		,type: "POST"	
	  });
  
  
	var selectedMemberIDlistObj = $('##filter_SELECTEDMEMBERIDLIST').val().trim();
	
	if(selectedMemberIDlistObj == ''){
		var selectedCount = 0;
	} else {
		var selectedCount = selectedMemberIDlistObj.split(',').length;
	}

	$('##sendTo').empty();	
			
	var unselected = parseInt(totalRecords)-parseInt(selectedCount);
		
	if(selectedCount > 0) {
		var selectedplural = 's';
		if(selectedCount==1) { selectedplural = '' };
		
		$('##sendTo').append($('<option>', {value: 'selectedMembersOnly', text : 'Send to the ' + $.number( selectedCount ) + ' selected member'+selectedplural+'.'}));
	}	
	
	
	if(unselected > 0 && unselected < totalRecords) {
		var unselectedplural = 's';
		if(unselected==1) { unselectedplural = '' };
	
		$('##sendTo').append($('<option>', {value: 'allExceptSelectMembers', text : 'Send to the ' + $.number(unselected) + ' unselected member'+unselectedplural+'.'}));
	}	
	
	if(selectedCount < totalRecords) {
		$('##sendTo').append($('<option>', {value: 'all', text : 'Send to ALL ' + $.number( totalRecords ) + ' members.'}));
	}	
		
		
		$('##sendTo').select2({placeholder: "Send To...",minimumResultsForSearch: "20"});
		



		$('##btnSendPreview').off('click');
		$('##btnSendPreview').on("click", function(e) { 
			$('##SENDMODAL').modal('hide');
			
			previewCampaign($('##sendCampaignID').val());
			
			
				
		});
		
		
		$('##btnPreviewClose').off('click');
		$('##btnPreviewClose').on("click", function(e) { 
			$('##SENDMODAL').modal({show: 'true', keyboard: 'true'});
			$('##PREVIEWMODAL').modal('hide'); 
		});
		
			
		$('##btnSendAction').off('click');
		$('##btnSendAction').on("click", function(e) { 
		
		
			if($('##sendCampaignID option:selected').val() == '') {
				alert('You must select a message to send.');
			} else if($('##sendTo option:selected').val() == '') {
				alert('You must select who you want to receive the message.');
			} else {
				$.ajax({ url:"#attributes.sendurl#"
					,success: function(result){
					
							var jResult = $.parseJSON(result);
							
							if(jResult[0].ERRORCODE == '000') {
								showAlert('.modal_target', 'success', 'Your message successfully queued up for delivery!');
								//window.console && console.log(jResult);
								$('##btnSendAction').hide();
								$('##btnSendPreview').hide();
								$('##btnSendClose').html("Close");
							} else if(jResult[0].ERRORCODE == '001'){					
								showAlert('.modal_target', 'danger', 'You must select an entity to bill these messages to...');
							} else {					
								showAlert('.modal_target', 'danger', jResult[0].ERRORMESSAGE);
							}
						//reloadTable();
						
						}
					,fail: function(result){
						$('##btnSendAction').show();
						alert(result);
						}
					,data: {
							"memberIDlist": $('##filter_SELECTEDMEMBERIDLIST').val()
							,"sendTo": $('##sendTo').val()
							,"billingEntityID": $('##billingEntityID').val()
							,"campaignID": $('##sendCampaignID').val()
							,"sendAfterDate": $('##sendAfterDate').val()
							,"sendAfterTime": $('##sendAfterTime').val()
							<cfloop list="#attributes.sendFields#" index="f">
							, "#f#": $('##filter_#ucase(f)#').val() 
							</cfloop>
						}
					,type: "POST"	
				  });
  			}

		});
		
		$('##SENDMODAL').modal({show: 'true', keyboard: 'true'});
		
		$(document).keydown(function(e) {
			if (e.keyCode == 27) { 
				$('##SENDMODAL').modal('hide'); 
				$(document).off('keyup');
			} 
		});
		
		
	
});

</cfif>


<cfif attributes.deleteurl is not "">
	
	
$('##btnDelete').on("click", function(e) {
	e.preventDefault(); 
	$('.modal_target').hide();
	
	if($('##filter_SELECTEDMEMBERIDLIST').val() == '') {
		alert('You must select at least one item to delete.');

	} else {
		var selectedCount = $('##filter_SELECTEDMEMBERIDLIST').val().split(',').length;
		$('##deleteMsg').html('Are you sure you want to DELETE the ' + selectedCount + ' selected #attributes.entityType#' + ((selectedCount > 1) ? 's' : '')+'?');
		$('##btnDeleteAction').show();
		
		$('##btnDeleteAction').off('click');
		$('##btnDeleteAction').on("click", function(e) { 
			
				$.ajax({ url:"#attributes.deleteurl#"
					,success: function(result){
						var jResult = $.parseJSON(result);
							if(jResult[0].ERRORCODE == '000') {
								reloadTable();
								$('##DELETEMODAL').modal('hide');
								clearAllChecked();
								resync();
							} else {					
								showAlert('.modal_target', 'danger', jResult[0].ERRORMESSAGE);
								$('##btnDeleteAction').hide();
								$('##deleteMsg').html('');
							}
						}
					,fail: function(result){
						alert(result);
						}
					,data: {
							"ids": $('##filter_SELECTEDMEMBERIDLIST').val()
						}
					,type: "POST"	
				  });
  			

		});
		
		$('##DELETEMODAL').modal('show');

		$(document).keydown(function(e) {
			if (e.keyCode == 27) { 
				$('##DELETEMODAL').modal('hide'); 
				$(document).off('keyup');
			} 
		});

	} 	
});
</cfif>




<cfif attributes.addurl is not "">

$('##btnAdd').on("click", function(e) {
	e.preventDefault(); 
	
	
	if(totalChildren == 0){
	
		location.href= '#attributes.addurl#&parentEntityID=#session.auth.PARENTENTITYID#'
	} else {


		
		$('##btnAddAction').off('click');
		$('##btnAddAction').on("click", function(e) { 
			if($('##add option:selected').val() == '') {
				alert('You must select a parent entity');
			} else {
				$(document).off('keyup');
				location.href= '#attributes.addurl#&parentEntityID='+$('##add option:selected').val()
  			}

		});
		
		$('##ADDMODAL').modal('show');
		$('.modal_target').hide();
		$(document).keydown(function(e) {
			if (e.keyCode == 27) { 
				$('##ADDMODAL').modal('hide'); 
				$(document).off('keyup');
			} 
		});
		
		
		}
		
});

</cfif>



function previewCampaign(id) {
	$.ajax({ url:"?action=campaigns.preview"
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
	
	$('##PREVIEWMODAL_title').html('Preview Campaign');
	$('##PREVIEWMODAL').modal({show: 'true', keyboard: 'false', backdrop: 'static'});		

}




$('##move').select2({placeholder: "Move",formatResult: formatOptions,formatSelection: formatOptions});
$('##add').select2({placeholder: "Add",formatResult: formatOptions,formatSelection: formatOptions});
$('##billingEntityID').select2({placeholder: "Bill To",formatResult: formatOptions,formatSelection: formatOptions});


 $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });

</cfoutput>		

</cfsavecontent>





