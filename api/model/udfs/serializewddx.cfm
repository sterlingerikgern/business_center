<cffunction name="serializewddx" output="false">
	<cfargument name="q" required="yes" default="">

		<cfset var wddxText = "">
		
		<cfwddx action = "cfml2wddx" input = #q# output = "wddxText">


	<cfreturn wddxText>

</cffunction>


<cffunction name="deserializewddx" output="false">
	<cfargument name="wddxText" required="yes" default="">

	<cfset var q = "">
		
		<cfwddx action = "wddx2cfml" input = #wddxText# output = "q">

	<cfreturn q>

</cffunction>



