<cfsilent>
<cfparam name="form.columnsInOrder" default="ENTITYNAME,MOBILEPHONE,EMAILADDRESS,CREATEDDATE">
<cfparam name="form.sEcho" default="1">
<cfparam name="form.keywords" default="">
<cfparam name="form.iDisplayStart" default="7">
<cfparam name="form.iDisplayLength" default="30">
<cfparam name="form.entityIDlist" default="1">
<cfparam name="form.iSortingCols" default="0">
<cfparam name="form.entityTypeID" default="10">
<cfparam name="sortOrder" default="">


<cfsetting showDebugOutput=false>
<cfsetting enablecfoutputonly="true">
<cfprocessingdirective suppresswhitespace="true">


<cfloop from="1" to="#form.iSortingCols#" index="i">
	<cfset fName = ListGetAt(columnsInOrder, evaluate("form.iSortCol_"&i-1)+1)>
	<cfset fOrder = evaluate("form.sSortDir_"&i-1)>
	<cfset sortOrder = ListAppend(sortOrder, "#fName# #iif(listFindNoCase("asc,desc", fOrder) GT 0, de(fOrder), de('asc'))#")>	
</cfloop>

<!---
<cfoutput>#sortOrder#</cfoutput><cfabort>
--->

<cfstoredproc datasource="perkz" procedure="proc_perkz_getEntityChildren">
	<cfprocresult name="rResult"  >  
	<cfprocparam cfsqltype="cf_sql_varchar" value="#form.entityIDlist#"><!--- entityIDList --->
	<cfprocparam cfsqltype="cf_sql_varchar" value="#form.entityTypeID#"><!--- entityTypeID --->
	<cfprocparam cfsqltype="cf_sql_int" value="#iif(sortOrder IS "", de('entityname asc'), de(sortOrder))#"><!--- sort order --->
	<cfprocparam cfsqltype="cf_sql_varchar" value="#replace(trim(form.keywords), " ", "%", "ALL")#"><!--- keywords --->
	<cfprocparam cfsqltype="cf_sql_integer"  type="out"  variable="totalRowCount"> 
	<cfprocparam cfsqltype="cf_sql_integer" value="#form.iDisplayStart#"><!--- offset rows default: 0--->
	<cfprocparam cfsqltype="cf_sql_integer" value="#form.iDisplayLength#"><!--- fetchNextRows default: 20--->
</cfstoredproc>

<cfquery dbtype="query" name="q">
	select #columnsInOrder#
	from rResult
</cfquery>

  <cfset json = "#serializeJSON(q)#">
    <cfset start_indicator = '"DATA":'>
    <cfset start_of_data = FindNoCase(start_indicator, json)>
    <cfset json = right(json, len(json)-(start_of_data+len(start_indicator)-1))>

<!--- create the JSON response --->
<cfsavecontent variable="variables.sOutput"><cfoutput>{
    "sEcho": #form.sEcho#,
    "iTotalRecords": #totalRowCount#,
    "iTotalDisplayRecords": #totalRowCount#,
    "aaData": #json#
    </cfoutput></cfsavecontent>
</cfprocessingdirective>
</cfsilent>
<cfoutput>#variables.sOutput#</cfoutput>