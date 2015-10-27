<!---
    Script:    DataTables server-side script for ColdFusion (cfm) and MySQL
    License:   GPL v2 or BSD (3-point) 
    Notes:
        tested with DataTables 1.6.1 and jQuery 1.2.6+, Adobe ColdFusion 9 (but should work fine on at least 7+)
         
        to work with pre 1.6 datatables replace both occurances of sSortDir_ with iSortDir_
         
        Get a free developer version of ColdFusion from http://www.adobe.com/products/coldfusion/
        or try out the open source railo cfml engine from http://www.getrailo.org/
 --->
<!---
    Easy set variables
 --->
  
<!--- table name --->
<cfset sTableName = "ajax" />
 
<!--- list of database columns which should be read and sent back to DataTables --->
<cfset listColumns = "engine,browser,platform,version,grade" />
 
<!--- Indexed column --->
<cfset sIndexColumn = "id" />
  
<!--- ColdFusion Datasource for the MySQL connection --->
<cfset coldfusionDatasource = ""/>
 
<!---
If you just want to use the basic configuration for DataTables with ColdFusion server-side, there is no need to edit below this line
 
Note: there is additional configuration below for the "version" column in query and output
 --->
 
<!---
    ColdFusion Specific Note: I handle Paging, Filtering and Ordering a bit different than some of the other server side versions
 --->
  
<!---
    Paging
--->
<!---
    ColdFusion Specific Note: I am handling paging in the cfoutput statement instead of limit.  
 --->
<cfparam name="url.iDisplayStart" default="0" type="integer" />
<cfparam name="url.iDisplayLength" default="10" type="integer" />
 
<!---
    Filtering
    NOTE: this does not match the built-in DataTables filtering which does it
        word by word on any field. It's possible to do here, but concerned about efficiency
        on very large tables, and MySQL's regex functionality is very limited
 --->
<!---
    ColdFusion Specific Note:
    I am handling this in the actual query call, because i want the statement parameterized to avoid possible sql injection
 --->
<cfparam name="url.sSearch" default="" type="string" />
 
<!---
    Ordering
 --->
<cfparam name="url.iSortingCols" default="0" type="integer" />
 
<!---
    SQL queries
    Get data to display
 --->
 
<!--- Data set after filtering --->
<cfquery datasource="#coldfusionDatasource#" name="qFiltered">
    SELECT SQL_CALC_FOUND_ROWS #listColumns#
        FROM #sTableName#
    <cfif len(trim(url.sSearch))>
        WHERE <cfloop list="#listColumns#" index="thisColumn"><cfif thisColumn neq listFirst(listColumns)> OR </cfif>#thisColumn# LIKE <cfif thisColumn is "version"><!--- special case ---><cfqueryparam cfsqltype="CF_SQL_FLOAT" value="#val(url.sSearch)#" /><cfelse><cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="%#trim(url.sSearch)#%" /></cfif></cfloop>
    </cfif>
    <cfif url.iSortingCols gt 0>
        ORDER BY <cfloop from="0" to="#url.iSortingCols-1#" index="thisS"><cfif thisS is not 0>, </cfif>#listGetAt(listColumns,(url["iSortCol_"&thisS]+1))# <cfif listFindNoCase("asc,desc",url["sSortDir_"&thisS]) gt 0>#url["sSortDir_"&thisS]#</cfif> </cfloop>
    </cfif>
</cfquery>
 
<!--- Total data set length --->
<cfquery datasource="#coldfusionDatasource#" name="qCount">
    SELECT COUNT(#sIndexColumn#) as total
    FROM   #sTableName#
</cfquery>
 
<!---
    Output
 --->
<cfcontent reset="Yes" />
{"sEcho": <cfoutput>#val(url.sEcho)#</cfoutput>,
"iTotalRecords": <cfoutput>#qCount.total#</cfoutput>,
"iTotalDisplayRecords": <cfoutput>#qFiltered.recordCount#</cfoutput>,
"aaData": [
    <cfoutput query="qFiltered" startrow="#val(url.iDisplayStart+1)#" maxrows="#val(url.iDisplayLength)#">
        <cfif currentRow gt (url.iDisplayStart+1)>,</cfif>
        [<cfloop list="#listColumns#" index="thisColumn"><cfif thisColumn neq listFirst(listColumns)>,</cfif><cfif thisColumn is "version"><cfif version eq 0>"-"<cfelse>"#jsStringFormat(version)#"</cfif><cfelse>"#jsStringFormat(qFiltered[thisColumn][qFiltered.currentRow])#"</cfif></cfloop>]
    </cfoutput> ] }