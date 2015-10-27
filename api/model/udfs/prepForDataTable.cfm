<cffunction name="prepForDataTable" output="false">
	<cfargument name="q" required="yes" default="">
	<cfargument name="columnsInOrder" required="no" default="">
	<cfargument name="sEcho" required="no" default="">
	<cfargument name="totalRowCount" required="no" default="">

		<cfset var cols = q>
		<cfset var sOutput = "">

		<cfif columnsInOrder IS "">
			<cfset columnsInOrder = q.columnList>
		</cfif>
		
		<cfquery dbtype="query" name="qoq">
			select #columnsInOrder#
			from q
		</cfquery>

		<cfset json = "#serializeJSON(qoq)#">
		<cfset start_indicator = '"DATA":'>
		<cfset start_of_data = FindNoCase(start_indicator, json)>
		<cfset json = right(json, len(json)-(start_of_data+len(start_indicator)-1))>


<cfsavecontent variable="sOutput"><cfoutput>{
"sEcho": #sEcho#,
"iTotalRecords": #totalRowCount#,
"iTotalDisplayRecords": #totalRowCount#,
"aaData": #json#
</cfoutput></cfsavecontent>


	<cfreturn sOutput>

</cffunction>



