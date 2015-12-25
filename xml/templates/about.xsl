<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/page/section" priority="1">
	<div class="colage">
		<xsl:call-template name="crumbs"/>
	</div>
	<div id="page_content" class="home">
		<xsl:apply-templates select="html"/>
		<xsl:apply-templates select="/page/news"/>
		<div class="s1"></div>
		<div class="s2"></div>
	</div>
</xsl:template>


<xsl:template match="carousel/row/img/preview">
	<figure><img src="{@src}" width="{@width}" height="{@height}" alt="{ancestor::row/title}"/>
		<xsl:apply-templates select="ancestor::row/title"/>
	</figure>
</xsl:template>

<xsl:template match="carousel/row/title">
	<figcaption>
		<xsl:value-of select="text()"/>
	</figcaption>
</xsl:template>

<!-- Приветственный текст -->
<xsl:template match="section/html" priority="1">
	<article>
		<h1>About the company</h1>
		<div class="wrap">
			<xsl:value-of select="text()" disable-output-escaping="yes"/>
		</div>
	</article>
</xsl:template>

<!-- Анонсы новостей -->
<xsl:template match="news[row]">
	<section class="news">
		<h3><xsl:value-of select="/page/structure/sec[@id='news']/@title"/></h3>
		<div class="wrap">
			<xsl:apply-templates select="row"/>
			<p class="show_all"><a href="news/">All news</a></p>
		</div>
	</section>
</xsl:template>
<xsl:template match="news/row">
	<xsl:if test="count(preceding-sibling::row) &lt; 3">
		<article>
			<xsl:apply-templates select="img/preview"/>
			<xsl:apply-templates select="title"/>
			<xsl:apply-templates select="date"/>
			<xsl:apply-templates select="announce"/>
			<p class="more"><noindex><a href="news/row{@id}/" rel="nofollow">Read more...</a></noindex></p>
		</article>
	</xsl:if>
</xsl:template>
<xsl:template match="news/row/date">
	<time datetime="{@value}"><xsl:value-of select="text()"/></time>
</xsl:template>
<xsl:template match="news/row/title">
	<div class="title"><a href="news/row{parent::*/@id}/"><xsl:value-of select="text()"/></a></div>
</xsl:template>
<xsl:template match="news/row/announce">
	<p><xsl:value-of select="text()"/></p>
</xsl:template>
<xsl:template match="news/row/img/preview">
	<img src="{@src}" alt="{ancestor::row/title/text()}" width="{@width}" height="{@height}"/>
</xsl:template>


</xsl:stylesheet>