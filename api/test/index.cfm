<cfparam name="url.token" default="">
<cfparam name="url.f" default="">
<cfparam name="url.a" default="">
<cfparam name="url.r" default="">
<cfparam name="url.phone" default="9048061289">


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>

    <title>JWT API Test App</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="">
	<meta name="author" content="" />

	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="prettify.css" />
	<link rel="stylesheet" href="app.css">

	
	
</head>

<body>


<div id="wrapper">


	
	<div id="content">		
		
		<div id="content-header">
			<div class="col-xs-10">
			<h1><i class="fa fa-connectdevelop"></i> API Test App</h1>
			</div>
		</div> <!-- #content-header -->	


		<div id="content-container">

<form id="testform">
 
 
			<div class="row">
				 <div class="col-sm-6">
	     			<div class="portlet">
						<div class="portlet-header">
							<h3>FORM Variables</h3>
							
							<ul class="portlet-tools pull-right">
								<li>
									<a href="javascript:;" class="btn btn-sm btn-icon btn-add-form-element">
										<i class="fa fa-plus-circle"></i>
									</a>
								</li>
							</ul>
							
						</div> <!-- /.portlet-header -->
						<div class="portlet-content form-element-holder">
						
								<div class="input-group col-xs-12">	
									<label for="token">f:</label>
									 <input type="text" name="f" placeholder="f" class="postable form-control"  value="<cfoutput>#url.f#</cfoutput>">
								</div>
								
								<div class="input-group col-xs-12">	
									<label for="token">a:</label>
									 <textarea name="a" placeholder="a"  class="postable form-control"><cfoutput>#htmlEditFormat(url.a)#</cfoutput></textarea>
								</div>
								
								<div class="input-group col-xs-12">	
									<label for="token">r:</label>
									 <input type="text" name="r" placeholder="r"  class="postable form-control"  value="<cfoutput>#url.r#</cfoutput>">
								</div>
						
						
						</div> <!-- /.portlet-content -->
					</div> <!-- /.portlet -->
				</div> <!-- /.col -->
				
				 <div class="col-sm-6">
					<div class="portlet">
						<div class="portlet-header">
							<h3>Header Variables</h3>
						
							<ul class="portlet-tools pull-right">
								<li>
									<a href="javascript:;" class="btn btn-sm btn-icon  btn-add-header-element">
										<i class="fa fa-plus-circle"></i>
									</a>
								</li>
							</ul>
							
						
						</div> <!-- /.portlet-header -->
						<div class="portlet-content header-element-holder">
						
								<div class="input-group col-xs-12">	
									<label for="token">Token:</label>
									 <input type="text"  name="token" id="token" value="<cfoutput>#url.token#</cfoutput>" class="headerelement form-control">
								</div>
						</div> <!-- /.portlet-content -->
					</div> <!-- /.portlet -->
				</div> <!-- /.col -->
			</div> <!-- /.row -->
				
			<div class="row">
				 <div class="col-sm-12">	
					
					<div class="portlet">
						<div class="portlet-header">
							<h3>URL & Method</h3>
						</div> <!-- /.portlet-header -->
						<div class="portlet-content">
						
							<div class="col-sm-2">
									<div class="input-group col-xs-12">	
										<label for="endpoint">Endpoint:</label>
										<select name="endpoint" id="endpoint" class="form-control">
											<option value="">--Select an Endpoint--</option>
											<option value="http://bcapi.webqa.sterlingpayment.com/rest/bc/bc_connect.json" selected>bc_connect</option>
										 </select>
									</div>
								</div>
								
								
							<div class="col-sm-6">
								<div class="input-group col-xs-12">	
									<label for="url">URL:</label>
									<input type="text"   name="url" id="url" style="width:100%" value="http://bcapi.webqa.sterlingpayment.com/rest/bc/bc_connect.json" placeholder="  <--- Select an endpoint">
								</div>
							</div>	
								
								<div class="col-sm-1">
									<div class="input-group col-xs-12">	
										<label for="mtype">Method:</label>
										<select name="mtype" id="mtype" class="form-control">
											<option value="POST">POST</option>
											<option value="GET">GET</option>
										</select>
									</div>
								</div>
								
							
								
								<div class="col-sm-1">
									<div class="input-group col-xs-12">	
										<label for="requestType">Type:</label>
										<select name="requestType" id="requestType" class="form-control">
											<option value="application/x-www-form-urlencoded">Form</option>
											<option value="application/json">json</option>
										</select>
									</div>
								</div>								
								
								<div class="col-sm-1"><br/>
										<button id="runTest" class="btn btn-primary">Run Test</button>
								</div>
									
								
						</div> <!-- /.portlet-content -->
					</div> <!-- /.portlet -->		
	            </div> <!-- /.col -->
			</div> <!-- /.row -->

</form>

			<div class="row">

				 <div class="col-sm-12">

			
					<div class="portlet"  id="div_output">
						<div class="portlet-header">
							<h3>Output/Results</h3>
						</div> <!-- /.portlet-header -->
						<div class="portlet-content">
								
								<div>Response Code: <span id="responseCode"></span></div>
								<pre id="output"  class="prettyprint linenums languague-json"></pre>
								
								
								
						</div> <!-- /.portlet-content -->
					</div> <!-- /.portlet -->
			
			 	 </div> <!-- /.col -->

					<div class="col-md-2 col-md-offset-5 hidden">
						<a href="?reload=true">Reload API System</a>
					</div>


				
			</div> <!-- /.row -->




		</div> <!-- /#content-container -->
		

	</div> <!-- #content -->
	
	
</div> <!-- #wrapper -->

<footer id="footer">
	<ul class="nav pull-right">
		<li>
			Copyright &copy; 2014, Sterling Payment Technologies
		</li>
	</ul>
</footer>



<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="prettify.js"></script>


<script>
		//document ready
		$(function() {
		
		
		$.fn.serializeAssoc = function() {

		  var dArray = {};
		
			$.each( this.serializeArray(), function( key, obj ) {
					  dArray[obj.name] = obj.value;
			});
		
			return dArray;
				
		};

$('#endpoint').on('change', function(){
	$('#url').val($(this).val());
});

$('.btn-add-form-element').on('click', function(){

	var element_name = prompt('Form element name:');
	if(element_name){
		$('.form-element-holder').append('<div class="input-group col-xs-12" id="div_'+element_name+'username"><label for="voidType">'+element_name+':</label><input type="text"   name="'+element_name+'" placeholder="'+element_name+'" value="" class="postable form-control"></div>');
		}
	
});


$('.btn-add-header-element').on('click', function(){

	var element_name = prompt('Header element name:');
	if(element_name){
		$('.header-element-holder').append('<div class="input-group col-xs-12" id="div_'+element_name+'username"><label for="voidType">'+element_name+':</label><input type="text"   name="'+element_name+'" placeholder="'+element_name+'" value="" class="headerelement form-control"></div>');
		}
	
});




 			function formatXml(xml) {

                var formatted = '';
                var reg = /(>)(<)(\/*)/g;
                xml = xml.replace(reg, '$1\r\n$2$3');
                var pad = 0;

                jQuery.each(xml.split('\r\n'), function(index, node)
                {
                    var indent = 0;
                    if (node.match( /.+<\/\w[^>]*>$/ ))
                    {
                        indent = 0;
                    }
                    else if (node.match( /^<\/\w/ ))
                    {
                        if (pad != 0)
                        {
                            pad -= 1;
                        }
                    }
                    else if (node.match( /^<\w[^>]*[^\/]>.*$/ ))
                    {
                        indent = 1;
                    }
                    else
                    {
                        indent = 0;
                    }
                    var padding = '';
                    for (var i = 0; i < pad; i++)
                    {
                        padding += '  ';
                    }
                    formatted += padding + node + '\r\n';
                    pad += indent;
                });

                return formatted;
            }

			
			
			$('button').click(function(){
			
			
				$('#output').html('Loading...');
				
				var frm = $('.postable');
				var frmAssoc = frm.serializeAssoc();
				var frmForm = frm.serialize();
				var frmJson = JSON.stringify(frmAssoc);
			
				var hdr = $('.headerelement');
				var hdrAssoc = hdr.serializeAssoc();
				 
				var contentTypeStr = $('#requestType').find('option:selected').val();
				
				$('#responseCode').text('Loading...');	
 				request = $.ajax({
					url: $('#url').val(),
					processData: false,
					dataType: 'text',
					contentType: contentTypeStr,
					type: $('#mtype').find('option:selected').val(),
					headers: hdrAssoc,
					data:  ((contentTypeStr == 'application/json') ?  frmJson : frmForm)
				});
				
			 	request.done(function (response, textStatus, jqXHR){
					
					$('#output').removeClass("prettyprinted");
					
					
					
					if($('#url').val().indexOf('xml') > 0) {
						$('#output').text(formatXml(jqXHR.responseText));
					} else {
						
						try {
							var xhrResponse = $.parseJSON(jqXHR.responseText);
							var token = xhrResponse.TOKEN;
							if(token) {
								$('#token').val(token);
							}

							var base64Url = token.split('.')[1];
							var base64 = base64Url.replace('-', '+').replace('_', '/');
							window.console && console.log($.parseJSON(window.atob(base64)));
							window.console && console.log(window.atob(base64));
							
							delete xhrResponse.TOKEN;
							var obj = xhrResponse;
								
						} catch(err) {
							obj = jqXHR;
							alert('Done w/ Catch: parsing XHR');
						}

						document.getElementById("output").innerHTML = JSON.stringify(obj, undefined, 2);
						
					}

					
					$('#responseCode').text(jqXHR.status);
				
					 
				});

				request.fail(function (jqXHR, textStatus, errorThrown){
				
					if($('#url').val().indexOf('xml') > 0) {
						$('#output').text(jqXHR.responseText);
					} else {
					
						try {
							var xhrResponse = $.parseJSON(jqXHR.responseText);
							var token = xhrResponse.TOKEN;
							if(token) {
								$('#token').val(token);
							}

							var base64Url = token.split('.')[1];
							var base64 = base64Url.replace('-', '+').replace('_', '/');
							window.console && console.log($.parseJSON(window.atob(base64)));
							window.console && console.log(window.atob(base64));
							
							delete xhrResponse.TOKEN;
							var obj = xhrResponse;
							//alert('fail: parsing jwt');
						} catch(err) {
							obj = jqXHR;
							//alert('fail: raw XHR');
						}
						document.getElementById("output").innerHTML = '<b>' + textStatus.toUpperCase() + '</b><br/>' + JSON.stringify(obj, undefined, 2);	
					}	
					
					$('#responseCode').text(jqXHR.status);
					
				});

				request.always(function (jqXHR) {
					
					$('#output').removeClass("prettyprinted");
					prettyPrint();
				});
				
				return false;
			});
			
		});

</script>
	

</body>
</html>