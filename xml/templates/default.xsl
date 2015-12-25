<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="elements.xsl"/>
<xsl:include href="form.xsl"/>
<xsl:output media-type="text/html" method="html" omit-xml-declaration="yes" indent="no" encoding="utf-8"/>

<!-- Шаблон страницы -->
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt;</xsl:text>
<html>
<head>
	<xsl:call-template name="head"/>
	<xsl:text disable-output-escaping="yes">&lt;!--[if IE 7]&gt;</xsl:text>
	<script src="js/ie7fix.js"></script>
	<xsl:text disable-output-escaping="yes">&lt;![endif]--&gt;</xsl:text>
	<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-23569315-21', 'auto');
  ga('send', 'pageview');

</script>
</head>
<body>
<!-- Yandex.Metrika counter -->
<script src="https://mc.yandex.ru/metrika/watch.js" type="text/javascript"></script>
<script type="text/javascript">
try {
    var yaCounter31430483 = new Ya.Metrika({
        id:31430483,
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true
    });
} catch(e) { }
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/31430483" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- Yandex.Metrika counter -->

<header>
	<div class="logo"><a href="{$_base_url}"><img src="images/logo.png" width="252" alt="{/page/site/@name}"/></a></div>
	<p class="about">
		Moscow legal company is the legal profession, developed partnerships and business relationships both in Moscow and in the key regions of the country.
	</p>
	<address>
		<p class="phone">
			<xsl:variable name="phone_code" select="substring-before(/page/site/@phone,')')"/>
			<xsl:choose>
				<xsl:when test="$phone_code">
					<span><xsl:value-of select="$phone_code"/>)</span><xsl:value-of select="substring-after(/page/site/@phone,')')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="/page/site/@phone"/>
				</xsl:otherwise>
			</xsl:choose>
			<br/>
		</p>
	</address>
	<a href="#feedbackFormPopupBody" id="feedbackFormPopup" class="feedback">call us</a>
</header>
<nav>
	<ul>
		<xsl:apply-templates select="/page/structure/sec[@class='menu']" mode="topMenuItem"/>
	</ul>
	<ol>
		<xsl:apply-templates select="/page/site" mode="social"/>
	</ol>
</nav>
<xsl:apply-templates select="/page/section"/>
<footer>
	<div class="footer_bg">
		<div class="address">
			<div class="footer_h">Contacts</div>
			<xsl:apply-templates select="/page/site" mode="address"/>
		</div>
		<nav>
			<div class="footer_h">Sections of the site</div>
			<ul>
				<xsl:apply-templates select="/page/structure/sec[@class='menu']" mode="footerMenuItem"/>
			</ul>
			<ol class="social_footer">
				<xsl:apply-templates select="/page/site" mode="social"/>
			</ol>
			<a target="_blank" class="feedback" href="contacts/#feedback_form">write to us</a>
		</nav>
	</div>
</footer>
<!--форма-->
<div id="feedbackFormPopupBody_bg">
<div id="feedbackFormPopupBody">
	<span id="close_popup_form">x</span>
	<xsl:apply-templates select="/page/form[@id='feedback_form_box']"/>
</div>
</div>
<script>
$(function(){
	$("#feedbackFormPopup").tosrus({buttons:{close:"#close_popup_form"}});
	<xsl:if test="/page/form[@id='feedback_form_box']/message">$('#feedbackFormPopup').click();</xsl:if>
});
</script>
</body>
</html>
</xsl:template>

<!-- social -->
<xsl:template match="/page/site" mode="social">
	<xsl:if test="@twitter">
		<li><a href="https://twitter.com/{@twitter}" target="_blank"><img src="images/twitter.png" width="30" height="30" alt="Twitter"/></a></li>
	</xsl:if>
	<xsl:if test="@facebook">
		<li><a href="https://www.facebook.com/{@facebook}" target="_blank"><img src="images/facebook.png" width="30" height="30" alt="Facebook"/></a></li>
	</xsl:if>
	<xsl:if test="@vk">
		<li><a href="http://vk.com/{@vk}" target="_blank"><img src="images/vk.png" width="30" height="30" alt="VK"/></a></li>
	</xsl:if>
</xsl:template>

<!-- section default -->
<xsl:template match="/page/section">
	<div class="colage">
		<xsl:call-template name="crumbs"/>
	</div>
	<div id="page_content">
		<article>
			<h1><xsl:value-of select="$_sec/@title"/></h1>
			<div class="wrap">
				<xsl:apply-templates/>
				<xsl:call-template name="subcontent"/>
			</div>
		</article>
		<xsl:call-template name="sidebar"/>
		<div class="s1"></div>
		<div class="s2"></div>
	</div>
</xsl:template>

<!-- sidebar -->
<xsl:template name="sidebar">
	<xsl:variable name="services" select="/page/structure/sec[@id='services']"/>
	<aside>
		<div class="specially_h">
			<xsl:value-of select="$services/@title"/>
		</div>
		<ul>
			<xsl:apply-templates select="$services/sec" mode="sideMenuItem"/>
		</ul>
	</aside>
	<!--xsl:apply-templates select="/page/news" mode="sidebar"/-->
</xsl:template>

<xsl:template match="structure//sec" mode="sideMenuItem">
	<xsl:call-template name="menuItem"/>
</xsl:template>

<!-- news sidebar -->
<xsl:template match="news[row]" mode="sidebar">
	<aside>
		<h1><xsl:value-of select="/page/structure/sec[@id='news']/@title"/></h1>
		<div class="wrap">
			<ul class="menu">
				<xsl:apply-templates select="row" mode="sidebar"/>
			</ul>
			<p class="show_all"><a href="news/">All news</a></p>
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

<!-- address -->
<xsl:template match="/page/site" mode="address">
	<ul>
		<xsl:if test="@phone">
			<li class="phone"><xsl:value-of select="/page/site/@phone"/></li>
		</xsl:if>
		<xsl:if test="@skype">
			<li class="skype">
				<script type="text/javascript" src="http://download.skype.com/share/skypebuttons/js/skypeCheck.js"></script>
				<a href="skype:{@skype}?call"><xsl:value-of select="/page/site/@skype"/></a>
			</li>
		</xsl:if>
		<xsl:if test="@email">
			<li class="mail"><a href="mailto:{/page/site/@email}"><xsl:value-of select="/page/site/@email"/></a></li>
		</xsl:if>
	</ul>
	<xsl:if test="@address">
		<address>
			<xsl:value-of select="/page/site/@address"/>
			<br /><br />
			<a href="contacts/">see location on map</a>
		</address>
	</xsl:if>
</xsl:template>

<!-- subcontent -->
<xsl:template name="subcontent">
	<p class="order-button">
		<a href="contacts/#feedback_form">Order service</a>
	</p>
</xsl:template>

<!--Crumbs-->
<xsl:template name="crumbs">
	<xsl:param name="title" select="false()"/>
	<xsl:choose>
		<xsl:when test="not($title = false())">
			<div id="crumbs">
				<span class="crumbs_shadow">
					<a href="{$_base_url}">Main</a>
					<xsl:apply-templates select="$_sec/ancestor-or-self::sec" mode="crumbs">
						<xsl:with-param name="select" select="false()"/>
					</xsl:apply-templates>
					<xsl:text> / </xsl:text>
					<span class="this_page">
						<xsl:call-template name="crumbsCut">
							<xsl:with-param name="text" select="$title"/>
						</xsl:call-template>
					</span>
				</span>
			</div>
		</xsl:when>
		<xsl:when test="count($_sec/ancestor::sec) &gt;= 0">
			<div id="crumbs">
				<span class="crumbs_shadow">
					<a href="{$_base_url}">Main</a>
					<xsl:apply-templates select="$_sec/ancestor-or-self::sec[not(@id='home')]" mode="crumbs"/>
				</span>
			</div>
		</xsl:when>
	</xsl:choose>
</xsl:template>
<xsl:template match="structure//sec" mode="crumbs">
	<xsl:param name="select" select="true()"/>
	<xsl:variable name="selected" select="$_sec/@id = @id"/>
	<xsl:choose>
		<xsl:when test="$select and $selected">
			<xsl:text> / </xsl:text>
			<span class="this_page">
				<xsl:value-of select="@title"/>
			</span>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text> / </xsl:text>
			<xsl:call-template name="menuLink">
				<xsl:with-param name="title">
					<xsl:call-template name="crumbsCut">
						<xsl:with-param name="text" select="@title"/>
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template name="crumbsCut">
	<xsl:param name="text"/>
	<xsl:value-of select="$text"/>
</xsl:template>

</xsl:stylesheet>