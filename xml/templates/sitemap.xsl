<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- section default -->
<xsl:template match="/page/section" priority="1">
	<div class="colage">
		<xsl:call-template name="crumbs"/>
	</div>
	<div id="page_content">
		<article>
			<h1><xsl:value-of select="$_sec/@title"/></h1>
			<div class="wrap">
				<xsl:apply-templates/>
				<xsl:apply-templates select="/page/structure/sec" mode="sitemap"/>
			</div>
		</article>
		<xsl:call-template name="sidebar"/>
		<div class="s1"></div>
		<div class="s2"></div>
	</div>
</xsl:template>

<xsl:template match="structure//sec" mode="sitemap">
	<li>
		<a href="{@id}/"><xsl:value-of select="@title" /></a>
		<xsl:if test="sec"><ul><xsl:apply-templates select="sec"  mode="sitemap"/></ul></xsl:if>
	</li>
</xsl:template>
</xsl:stylesheet>