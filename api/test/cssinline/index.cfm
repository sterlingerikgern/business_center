

<cfsavecontent variable="css">
.ReadMsgBody {
	width: 100%;
	background-color: #ffffff;
}
.ExternalClass {
	width: 100%;
	background-color: #ffffff;
}
body {
	width: 100%;
	background-color: #ffffff;
	margin: 0;
	padding: 10;
	-webkit-font-smoothing: antialiased;
	font-family: Georgia, Times, serif
}
a {
	text-decoration: none;
	color: #02764F;
}
table {
	border-collapse: collapse;
}
@media only screen and (max-width: 640px) {
body[yahoo] .deviceWidth {
	width: 440px!important;
	padding: 0;
}
body[yahoo] .center {
	text-align: center!important;
}
}
@media only screen and (max-width: 479px) {
body[yahoo] .deviceWidth {
	width: 280px!important;
	padding: 0;
}
body[yahoo] .center {
	text-align: center!important;
}
}
._txt1 {
	font-size: 22px;
	font-weight: bold;
	color: #4B4B4B;
	padding-bottom:24px;
}
._txt2 {
	font-size: 24px;
	color: #6E6E6E;
	font-weight: light;
	text-align: center;
	font-family: Georgia, Times, serif;
	line-height: 30px;
	vertical-align: middle;
	padding: 30px 20px 20px 20px;
	font-style: italic;
}
._txt3 {
	font-size: 18px;
	color: #424242;
	font-weight: normal;
	text-align: left;
	font-family: Georgia, Times, serif;
	line-height: 32px;
}
._txt4 {
	color: #ffffff;
	font-size: 18 px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	font-family: Arial, sans-serif;
	-webkit-text-size-adjust: none;
	background-color: #02764F;
	padding: 12px 0px 12px 0px;
	border-radius: 14px;
	width: 200px;
	height: 60px;
}
._txt5 {
	font-size: 12px;
	padding-top: 22px;
	color: #5B5B5B;
}
._txt6 {
	font-size: 11px;
	color: #999;
	font-family: Arial, sans-serif;
	text-align: left;
}
._img1 {
	width: 100%;
}
#_img2 {
	width: 100%;
}
.spt_customer_logo {
	padding-top: 10px;
	alignment-adjust: middle;
}
.spt_table_body {
	vertical-align: top;
	padding: 20px 12px 12px 20px;
	background-color: #CAF9FF;
}
.spt_footer {
	background-color: #FFF;
	padding-top: 10px;
}
.color_border_bottom {
	height: 6px;
	background-color: #BF6300;
}
.word {
	special: value;
}
</cfsavecontent>

<cfsavecontent variable="cnnhtml">
<img src="whatever.jpg" class   =    "_txt4">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
<img src="whatever.jpg" class   =    "color_border_bottom">
<a href="blhm.thml" class="spt_footer">Words</a>
<img src="whatver.gif"       class=word>
</cfsavecontent>


<cfoutput>


 
<cfset doc = application.jsoup.parse(cnnhtml)>
<cfset HTML_DOM = doc.select("[class]")>

<cfloop index="e" array="#HTML_DOM#">
	<cfset class =  e.attr("class")>
	<cfset MatchingSelectors = REMatch("[^}]*#class#[^{]*{[^}]*[\s]*:[\s]*([^;}]*[^}]*})",css)>
	<cfif arrayLen(MatchingSelectors)>
		<cfset inlinestyle="#trim(replace(replace(replace(reReplaceNoCase(MatchingSelectors[1], ".#class# {", ""), "}", ""), chr(10), "", "ALL"), chr(9), "", "ALL"))#">
		<cfset e.attr('style', '#inlinestyle#')>
	</cfif>
</cfloop>


</cfoutput>


<pre>
<cfdump var="#HTML_DOM.select("*").toString()#">
</pre>
<cfabort>

	