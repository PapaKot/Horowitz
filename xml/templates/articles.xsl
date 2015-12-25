<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="pagination.xsl"/>

<xsl:template match="/page/section" priority="1">
	<xsl:apply-templates select="articles | article"/>
</xsl:template>

<xsl:template match="/page/section/articles[row]">
	<header>
		<xsl:call-template name="crumbs"/>
		<h1><xsl:value-of select="$_sec/@title"/></h1>
		<xsl:call-template name="submenu"/>
	</header>
	<div class="content">
		<xsl:apply-templates select="row"/>
		<xsl:call-template name="pagination">
			<xsl:with-param name="numpages" select="number(@pages)"/>
			<xsl:with-param name="page" select="number(@page)"/>
			<xsl:with-param name="url">
				<xsl:value-of select="$_sec/@id"/><xsl:text>/</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="pageparam" select="@pageParam"/>
		</xsl:call-template>
	</div>
</xsl:template>

<xsl:template match="section/articles/row">
	<article class="list">
		<xsl:apply-templates select="date"/>
		<xsl:apply-templates select="title"/>
		<xsl:apply-templates select="announce"/>
		<p class="more"><a href="{@section}/row{@id}/">read more…</a></p>
	</article>
</xsl:template>

<xsl:template match="section/articles/row/date">
	<time datetime="{@value}"><xsl:value-of select="text()"/></time>
</xsl:template>

<xsl:template match="section/articles/row/title">
	<header>
		<h1><xsl:value-of select="text()"/></h1>
	</header>
</xsl:template>

<xsl:template match="section/articles/row/announce">
	<p><xsl:value-of select="text()" disable-output-escaping="yes"/></p>
</xsl:template>


<!-- Detail article -->
<xsl:template match="article">
	<header>
		<nav class="crumbs">
			<a href="{$_sec/@id}/"><xsl:value-of select="$_sec/@title"/></a>
			<xsl:text> / </xsl:text>
			<a href="{$_sec/@id}/row{@id}/" class="selected"><xsl:value-of select="title"/></a>
		</nav>
		<h1><xsl:value-of select="title"/></h1>
	</header>
	<div class="content">
		<div><xsl:apply-templates select="date"/></div>
		<xsl:apply-templates select="img"/>
		<xsl:value-of select="article/text()" disable-output-escaping="yes" />
		<a href="{base_url}{$_sec/@id}/" class="back">back to list</a>
	</div>
	<script>$(function(){$(".content .thumb").tosrus();});</script>
</xsl:template>

<xsl:template match="section/article/date">
	<time class="side" datetime="{@value}"><xsl:value-of select="text()"/></time>
</xsl:template>

<xsl:template match="article/img/preview">
	<a href="{parent::img/@src}" title="{@alt}" class="thumb"><img src="{@src}" alt="{ancestor::row/title/text()}" width="{@width}" height="{@height}" class="left"/></a>
</xsl:template>

</xsl:stylesheet>