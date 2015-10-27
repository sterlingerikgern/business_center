<cfset cfcs["bc_validation"] = createObject("component","validation").init(dsn=application.dsn, keyString="$terlingKeySTring")>
<cfset cfcs["jwt"] = createObject("component","jwt").init(dsn=application.dsn, key="Th!$sH0uLDb3lON6eN0U64")>

