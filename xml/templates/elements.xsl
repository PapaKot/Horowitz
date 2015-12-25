<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output media-type="text/html" method="html" omit-xml-declaration="yes" indent="no" encoding="utf-8"/>
<!-- Текущий раздел -->
<xsl:variable name="_sec" select="/page/structure//sec[@selected='selected']"/>
<!-- Базовый URL -->
<xsl:variable name="_base_url" select="/page/@base_url"/>

<!-- Заголовочные тэги -->
<xsl:template name="head">
	<base href="{$_base_url}"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="generator" content="Active Page 6.0" />
	<link rel="shortcut icon" href="favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="js/jQuery.TosRUs-master/src/css/jquery.tosrus.all.css"/>
	<title>
		<xsl:choose>
			<xsl:when test="/page/meta[@name='title']/text()">
				<xsl:value-of select="/page/meta[@name='title']/text()" />
				<xsl:text> - </xsl:text>
				<xsl:value-of select="/page/site/@name"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$_sec/@title"/>
				<xsl:text> - </xsl:text>
				<xsl:value-of select="/page/site/@name"/>
			</xsl:otherwise>
		</xsl:choose>
	</title>
	
	<meta name="keywords">
		<xsl:attribute name="content">
			<xsl:choose>
				<xsl:when test="/page/meta[@name='keywords']/text()">
					<xsl:value-of select="/page/meta[@name='keywords']/text()" />
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="/page/site/meta[@name='keywords']/text()" /></xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</meta>
	
	<meta name="description">
		<xsl:attribute name="content">
			<xsl:choose>
				<xsl:when test="/page/meta[@name='description']/text()">
					<xsl:value-of select="/page/meta[@name='description']/text()" />
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="/page/site/meta[@name='description']/text()" /></xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</meta>
	
	<link href="css/default.css" rel="stylesheet" type="text/css"/>
	<link href="css/style.css" rel="stylesheet" type="text/css"/>
	<xsl:apply-templates select="/page/section/link"/>	
	
	<xsl:text disable-output-escaping="yes">&lt;!--[if lt IE 9]&gt;</xsl:text>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<xsl:text disable-output-escaping="yes">&lt;![endif]--&gt;</xsl:text>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<!--<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>-->
	<script src="js/jQuery.TosRUs-master/src/js/jquery.tosrus.min.all.js"></script>
</xsl:template>
<xsl:template match="link[@rel]">
	<xsl:copy-of select="."/>
</xsl:template>

<!-- menu item -->
<xsl:template name="menuLink">
	<xsl:param name="isSelected" select="false()"/>
	<a>
		<xsl:if test="$isSelected">
			<xsl:attribute name="class">selected</xsl:attribute>
		</xsl:if>
		<xsl:attribute name="href">
			<xsl:if test="not(@id='home')">
				<xsl:value-of select="@id"/>
				<xsl:text>/</xsl:text>
			</xsl:if>
		</xsl:attribute>
		<xsl:value-of select="@title"/>
	</a>
</xsl:template>
<xsl:template name="menuItem">
	<xsl:param name="isListItem" select="true()"/>
	<xsl:param name="hasSubMenu" select="false()"/>
	<xsl:param name="hasLinkIfchildren" select="true()"/>
	<xsl:choose>
		<xsl:when test="$isListItem">
			<xsl:variable name="isSelected" select="$_sec/ancestor-or-self::sec/@id = @id"/>
			<li>
				<xsl:if test="$isSelected or (sec and $hasSubMenu)">
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="$isSelected">
								<xsl:text>selected</xsl:text>
								<xsl:if test="sec and $hasSubMenu"> open</xsl:if>
							</xsl:when>
							<xsl:when test="sec and $hasSubMenu">close</xsl:when>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="sec and $hasSubMenu and not($hasLinkIfchildren)">
						<h2><xsl:value-of select="@title"/></h2>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="menuLink"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="sec and $hasSubMenu">
					<ul>
						<xsl:apply-templates select="sec" mode="menuItemSubMenu"/>
					</ul>
				</xsl:if>
			 </li>
		</xsl:when>
		<xsl:otherwise>
			<xsl:variable name="isSelected" select="$_sec/@id = @id"/>
			<xsl:call-template name="menuLink">
				<xsl:with-param name="isSelected" select="$isSelected"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="structure//sec" mode="topMenuItem">
	<xsl:call-template name="menuItem">
		<xsl:with-param name="hasSubMenu" select="true()"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="structure//sec[@id='staff']" mode="topMenuItem">
	<xsl:variable name="isSelected" select="$_sec/ancestor-or-self::sec/@id = @id"/>
	<li>
		<xsl:if test="$isSelected or (sec and $hasSubMenu)">
			<xsl:attribute name="class">
				<xsl:text>selected</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<xsl:call-template name="menuLink"/>
		<xsl:apply-templates select="/page/staff[row]" mode="menuItemSubMenu"/>
	 </li>
</xsl:template>

<xsl:template match="/page/staff" mode="menuItemSubMenu">
	<ul>
		<xsl:apply-templates select="row" mode="menuItemSubMenu"/>
	</ul>
</xsl:template>

<xsl:template match="/page/staff/row" mode="menuItemSubMenu">
	<li>
		<a href="staff/row{@id}/"><xsl:value-of select="title"/></a>
	</li>
</xsl:template>

<xsl:template match="structure//sec" mode="footerMenuItem">
	<xsl:call-template name="menuItem"/>
</xsl:template>

<xsl:template match="structure//sec" mode="menuItemSubMenu">
	<xsl:call-template name="menuItem"/>
</xsl:template>

<!-- Остальное -->
<xsl:template match="html">
	<xsl:value-of select="text()" disable-output-escaping="yes" />
</xsl:template>

</xsl:stylesheet>
