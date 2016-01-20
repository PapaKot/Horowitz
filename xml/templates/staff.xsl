<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="pagination.xsl"/>

<xsl:template match="/page/section" priority="1">
	<xsl:apply-templates select="staff | staffRow"/>
</xsl:template>

<xsl:template match="/page/section/staff[row]">
	<div class="colage">
		<xsl:call-template name="crumbs"/>
	</div>
	<div id="page_content">
		<section class="news">
			<h1><xsl:value-of select="$_sec/@title"/></h1>
			<xsl:call-template name="pagination">
				<xsl:with-param name="numpages" select="number(@pages)"/>
				<xsl:with-param name="page" select="number(@page)"/>
				<xsl:with-param name="url">
					<xsl:value-of select="$_sec/@id"/><xsl:text>/</xsl:text>
				</xsl:with-param>
				<xsl:with-param name="pageparam" select="@pageParam"/>
			</xsl:call-template><!--Title-->			
			<script type="text/javascript" src="js/todo.js"></script>
			<script type="text/javascript" src="js/columns.js"></script>
			<div class="wrap staff_page">
				<div id="news_list">
					<xsl:apply-templates select="row"/>				
				</div>
			</div>
			<div class="wrap">
				<xsl:call-template name="subcontent"/>
			</div>
		</section>
		<xsl:call-template name="sidebar"/>		
	</div>		
</xsl:template>

<xsl:template match="section/staff/row">
	<article>
		<a href="{@section}/row{@id}/"><xsl:apply-templates select="img/preview"/></a>
		<a href="{@section}/row{@id}/"><xsl:apply-templates select="title"/></a>		
		<xsl:apply-templates select="announce"/>
	</article>
</xsl:template>

<xsl:template match="staff/row/img/preview">
	<img class="left" src="{@src}" width="{@width}" height="{@height}" alt="{parent::row/title}"/>
</xsl:template>

<xsl:template match="section/staff/row/title">
		<div class="news_h"><xsl:value-of select="text()"/></div>
</xsl:template>

<xsl:template match="section/staff/row/announce">
	<p><xsl:value-of select="text()" disable-output-escaping="yes"/></p>
</xsl:template>



<!-- Detail article -->
<xsl:template match="staffRow">
	<div class="colage">
		<xsl:call-template name="crumbs">
			<xsl:with-param name="title" select="title"/>
		</xsl:call-template>
	</div>
	<div id="page_content">
		<article>
			<h1><xsl:value-of select="title"/></h1>
			<div class="wrap">
				<div><xsl:apply-templates select="date"/></div>
				<xsl:apply-templates select="img"/>
				<xsl:value-of select="article/text()" disable-output-escaping="yes" />
				<p class="show_all show_all_left">	
					<a href="{base_url}{$_sec/@id}/" class="back">back to list</a>
				</p>
			</div>
		</article>
		<xsl:call-template name="sidebar"/>
		<div class="s1"></div>
		<div class="s2"></div>
	</div>
	<script>$(function(){$("#page_content .thumb").tosrus();});</script>
</xsl:template>

<xsl:template match="section/staffRow/date">
	<time class="side" datetime="{@value}"><xsl:value-of select="text()"/></time>
</xsl:template>

<xsl:template match="staffRow/img/preview">
	<a href="{parent::img/@src}" title="{@alt}" class="thumb"><img src="{@src}" alt="{ancestor::row/title/text()}" width="{@width}" height="{@height}" class="left"/></a>
</xsl:template>

</xsl:stylesheet>