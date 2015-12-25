<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="pagination.xsl"/>

<xsl:template match="/page/section" priority="1">
	<div class="colage">
		<xsl:call-template name="crumbs"/>
	</div>
	<div id="page_content">
		<article class="services">
			<h1><xsl:call-template name="h1"/></h1>
			<div class="wrap">
				<xsl:apply-templates select="parent::section/html"/>
				<h2>Services</h2>
				<xsl:apply-templates select="html"/>
				<!--ul>
					<xsl:apply-templates select="$_sec/sec" mode="subMenuItem"/>
				</ul-->
				<xsl:call-template name="subcontent"/>
			</div>
		</article>

		<xsl:call-template name="sidebar"/>
		<div class="s1"></div>
		<div class="s2"></div>
	</div>
</xsl:template>

<xsl:template match="structure//sec" mode="subMenuItem">
	<xsl:call-template name="menuItem"/>
</xsl:template>
		
<!--xsl:template match="/page/section" priority="1">
	<div class="colage"></div>
	<xsl:apply-templates select="articles | article"/>
</xsl:template-->

<xsl:template match="/page/section/articles[row]">
	<div id="page_content">
		<article class="services">
			<h1><xsl:call-template name="h1"/></h1>
			<div class="wrap">
				<xsl:apply-templates select="parent::section/html"/>
				<h2>Services</h2>
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
		</article>

		<xsl:call-template name="sidebar"/>
		<div class="s1"></div>
		<div class="s2"></div>
	</div>	
</xsl:template>

<xsl:template match="section/articles/row">
	<ul class="list">
		<li><a href="{@section}/row{@id}/"><xsl:apply-templates select="title"/></a></li>
	</ul>
</xsl:template>

<xsl:template name="h1">
	<xsl:param name="h1" select="$_sec/@title" />
	<xsl:choose>
		<xsl:when test="/page/section/@h1"><xsl:value-of select="/page/section/@h1"/></xsl:when>
		<xsl:otherwise><xsl:value-of select="$h1"/></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="section/articles/row/date">
	<time datetime="{@value}"><xsl:value-of select="text()"/></time>
</xsl:template>

<xsl:template match="section/articles/row/title">
	<xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="section/articles/row/announce">
	<p><xsl:value-of select="text()" disable-output-escaping="yes"/></p>
</xsl:template>


<!-- Detail article -->
<xsl:template match="article">
	<div id="page_content">
		<article>
			<h1><xsl:call-template name="h1" >
				<xsl:with-param name="h1" select="title"/>
			</xsl:call-template></h1>
			<div class="wrap">
				<xsl:apply-templates select="img"/>
				<xsl:value-of select="article/text()" disable-output-escaping="yes" />
				<a href="{base_url}{$_sec/@id}/" class="back">back to list</a>
			</div>
		</article>
		
		<xsl:call-template name="sidebar"/>
		<div class="s1"></div>
		<div class="s2"></div>
	</div>
</xsl:template>

<xsl:template match="section/article/date">
	<time class="side" datetime="{@value}"><xsl:value-of select="text()"/></time>
</xsl:template>

<xsl:template match="article/img/preview">
	<a href="{parent::img/@src}" title="{@alt}" rel="gallery[1]"><img src="{@src}" alt="{ancestor::row/title/text()}" width="{@width}" height="{@height}" class="left"/></a>
	<script type="text/javascript">todo.onload(function(){todo.gallery('gallery');});</script>
</xsl:template>


<!-- news sidebar -->
<xsl:template match="news[row]" mode="sidebar">
	<aside>
		<h1><xsl:value-of select="/page/structure/sec[@id='news']/@title"/></h1>
		<div class="wrap">
			<ul class="menu">
				<xsl:apply-templates select="row" mode="sidebar"/>
			</ul>
			<p class="show_all"><a href="news/">all news</a></p>
		</div>
	</aside>
</xsl:template>
<xsl:template match="news/row" mode="sidebar">
	<li>
		<a href="news/row{@id}/">
			<time datetime="{date/@value}"><xsl:value-of select="date/text()"/></time><br />
			<span><xsl:value-of select="title/text()"/></span>
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>