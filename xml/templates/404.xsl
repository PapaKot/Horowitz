<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/page/section" priority="1">
	<div class="colage"></div>
	<div id="page_content">
		<article>
			<h1>Error 404, Page Not Found</h1>
			<div class="wrap">
				<p>The requested page does not exist. We offer to go to any section of the site.</p>
			</div>
		</article>
		<xsl:call-template name="sidebar"/>
		<div class="s1"></div>
		<div class="s2"></div>
	</div>
</xsl:template>

</xsl:stylesheet>