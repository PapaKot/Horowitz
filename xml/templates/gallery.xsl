<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="pagination.xsl"/>

<xsl:template match="/page/section" priority="1">
	<div class="colage">
		<xsl:call-template name="crumbs"/>
	</div>
	<div id="page_content" class="all_block">
	<noscript>
			<style>
				.da-thumbs li a div {
					top: 0px;
					left: -100%;
					-webkit-transition: all 0.3s ease;
					-moz-transition: all 0.3s ease-in-out;
					-o-transition: all 0.3s ease-in-out;
					-ms-transition: all 0.3s ease-in-out;
					transition: all 0.3s ease-in-out;
				}
				.da-thumbs li a:hover div{
					left: 0px;
				}
			</style>
		</noscript>
		<section>
			<h1><xsl:value-of select="$_sec/@title"/></h1>
			<div class="wrap">
				<xsl:apply-templates/>
				<xsl:call-template name="subcontent"/>
			</div>			
		</section>
	</div>
</xsl:template>

<xsl:template match="section/photos[img]">
	<ul id="da-thumbs" class="da-thumbs">
		<xsl:apply-templates select="img/preview"/>
	</ul>
	<script type="text/javascript" src="js/jquery.hoverdir.js"></script>	
	<script type="text/javascript">
		$(function() {		
			$('#da-thumbs > li').hoverdir( {
				hoverDelay	: 50,
				reverse		: true
			} );
		});
	</script>
	<script>$(function(){$(".da-thumbs .thumb").tosrus();});</script>
</xsl:template>

<xsl:template match="photos/img/preview">
	<li><a href="{parent::img/@src}" target="_blank" class=".thumb"><img src="{@src}" width="{@width}" height="{@height}" alt="{parent::img/@title}"/>
	<div><span><xsl:value-of select="parent::img/@title" /></span></div></a></li>	
</xsl:template>

</xsl:stylesheet>