<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/page/section" priority="1">
	<div class="colage">
		<xsl:call-template name="crumbs"/>
	</div>
	<div id="page_content">
		<article>
			<h1><xsl:value-of select="$_sec/@title"/></h1>
			<div class="wrap">
				<xsl:apply-templates select="photos"/>
				<xsl:apply-templates select="html"/>
				<p><a href="{$_sec/parent::sec/@id}/" class="back">back to services</a></p>
				<xsl:call-template name="subcontent"/>
			</div>
		</article>
		<xsl:call-template name="sidebar"/>
		<div class="s1"></div>
		<div class="s2"></div>
	</div>
	<script>$(function(){$("#page_content .thumb").tosrus();});</script>
</xsl:template>

<xsl:template match="photos/img/preview">
	<a href="{parent::img/@src}" title="{@alt}" class="thumb"><img src="{@src}" alt="{ancestor::row/title/text()}" width="{@width}" height="{@height}" class="left"/></a>
</xsl:template>

</xsl:stylesheet>