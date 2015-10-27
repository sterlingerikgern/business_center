<cffunction name="query2JSON" output="false">
	<cfargument name="q" required="yes" default="">

<cfset var cols = q.columnList>



<cfsavecontent variable="json"><cfoutput>
[
<cfloop from="1" to="#q.recordcount#" index="row">
{
<cfloop list="#cols#" index="col" >
"#col#":"#q[col][row]#",
</cfloop>
"row": #row#

}<cfif row LT q.recordcount>,</cfif>
</cfloop>
]</cfoutput>
</cfsavecontent>


	<cfreturn json>

</cffunction>



