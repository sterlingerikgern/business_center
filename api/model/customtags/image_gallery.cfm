<cfparam name="attributes.button" default="##logoBtn">
<cfparam name="attributes.entityid" default="1">
<cfparam name="attributes.imageTypeName" default="email">
<cfparam name="attributes.imageTypeID" default="2">


<cfoutput>	       



<cfsavecontent variable="caller.rc.modal.imagesModal.body">
	<ul id="myTab1" class="nav nav-tabs">
		<li class="active"> <a href="##library_tab" data-toggle="tab"><i class="fa fa-camera-retro"></i> Image Library</a> </li>
		<li> <a href="##upload_tab" data-toggle="tab"><i class="fa fa-cloud-upload"></i> Upload a New Image</a> </li>
	</ul>
	<div id="myTab1Content" class="tab-content">
			<div class="tab-pane fade in active" id="library_tab">
				<div id="imageLibDiv"></div>
			</div>
			<div class="tab-pane fade" id="upload_tab">
				<div id="filelist_gallery">Your browser doesn't have Flash, Silverlight or HTML5 support.</div>
				<div id="container_gallery">
					<a href="javascript:;" class="btn btn-primary" id="pickfiles_gallery">Select files</a>
					<button id="uploadfiles_gallery"  class="btn btn-default">Upload files</button>
					
				</div>
			</div>
	</div>
</cfsavecontent>	
<cfsavecontent variable="caller.rc.modal.imagesModal.footer">
	<button type="button" class="btn btn-tertiary" data-dismiss="modal">Close</button>
</cfsavecontent>	
							
			
						

<cfset caller.rc.js_libs = listPrepend(caller.rc.js_libs, "/assets/js/libs/plupload/js/plupload.full.min.js")>



</cfoutput>	


<cfsavecontent variable="caller.rc.jquery">
<cfoutput>		


$('#attributes.button#').on('click', function(e) {
	var targetField = $(e.target);
	
	loadImagesLib();
		$('##IMAGESMODAL').modal('show');
		
		$('##btnUpdateField').off('click');
		$('##btnUpdateField').on("click", function(e) { 
			$('##IMAGESMODAL').modal('hide');
		});

		
		$(document).keydown(function(e) {
			if (e.keyCode == 27) { 
				$('##IMAGESMODAL').modal('hide'); 
				$(document).off('keyup');
			} 
		});
	});	


	$(document).on( 'shown.bs.tab', 'a[data-toggle="tab"]', function (e) {
		window.console && console.log($(e.target));
		if($(e.target).attr('href') == '##library_tab') {
			loadImagesLib();
		 } else if($(e.target).attr('href') == '##upload_tab') {
				document.getElementById('filelist_gallery').innerHTML = '';
				gallery_uploader.splice();
				gallery_uploader.refresh();
				$('##uploadfiles_gallery').removeClass('btn-primary');
				$('##uploadfiles_gallery').removeClass('btn-default');
				$('##pickfiles_gallery').removeClass('btn-primary');
				$('##pickfiles_gallery').removeClass('btn-default');
				$('##pickfiles_gallery').addClass('btn-primary');
				$('##uploadfiles_gallery').addClass('btn-default');
			
		 }
	})
	
	
deleteImage = function(imageID){	
	var date = new Date();
	var timestamp = date.getTime();
	
		$.ajax({ url:"/index.cfm?action=imagelibrary.browse&entityID=#attributes.entityID#&imageTypeName=#attributes.imageTypeName#&ImageTypeID=#attributes.ImageTypeID#&deleteImage="+imageID+"&t="+timestamp
				,success: function(result){
					$('##imageLibDiv').html(result);
					
					}
				,fail: function(result){
					$('##imageLibDiv').html(result);
					console.warn('danger', result);
					}
				,type: "GET"	
				,cache: false
			  });
}


loadImagesLib = function() {

	var date = new Date();
	var timestamp = date.getTime();

			$.ajax({ url:"/index.cfm?action=imagelibrary.browse&entityID=#attributes.entityID#&imageTypeName=#attributes.imageTypeName#&ImageTypeID=#attributes.ImageTypeID#&t="+timestamp
				,success: function(result){
					$('##imageLibDiv').html(result);
					
					}
				,fail: function(result){
					$('##imageLibDiv').html(result);
					console.warn('danger', result);
					}
				,type: "GET"
				,cache: false	
			  });
}



	var gallery_uploader = new plupload.Uploader({
		runtimes : 'html5,flash,silverlight,html4',
		browse_button : 'pickfiles_gallery',
		container: document.getElementById('container_gallery'), 
		url : "/index.cfm?action=imagelibrary.upload&parentEntityID=#attributes.entityID#&ImageTypeID=#attributes.ImageTypeID#&imageTypeName=#attributes.imageTypeName#",
		filters : {
			max_file_size : '10mb',
			mime_types: [
				{title : "Image files", extensions : "jpg,gif,png"},
				{title : "Zip files", extensions : "zip"}
			]
		},
		flash_swf_url : '/plupload/js/Moxie.swf',
		silverlight_xap_url : '/plupload/js/Moxie.xap',
		init: {
			PostInit: function() {
				document.getElementById('filelist_gallery').innerHTML = '';
				document.getElementById('uploadfiles_gallery').onclick = function() {
					gallery_uploader.start();
					return false;
				};
			},
			FilesAdded: function(up, files) {
				plupload.each(files, function(file) {
					document.getElementById('filelist_gallery').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></div>';
				});

				$('##uploadfiles_gallery').removeClass('btn-primary');
				$('##uploadfiles_gallery').removeClass('btn-default');
				$('##pickfiles_gallery').removeClass('btn-primary');
				$('##pickfiles_gallery').removeClass('btn-default');
				$('##pickfiles_gallery').addClass('btn-default');
				$('##uploadfiles_gallery').addClass('btn-primary');
			},
			UploadProgress: function(up, file) {
				var fileDetails = file.name.split('.');
				window.console && console.log(file);
				document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
			},
			UploadComplete: function(file) {
				alert(file.files[0].name+' has been added to  your Image Library. \n\nSelect the "Image Library" tab to place the image.');
				window.console && console.log(file);
			},
			Error: function(up, err) {
				window.console && console.log("\nError ##" + err.code + ": " + err.message);
			}
		}
	});





gallery_uploader.init();

</cfoutput>		

</cfsavecontent>



