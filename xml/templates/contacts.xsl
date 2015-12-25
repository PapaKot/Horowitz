<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet  [
	<!ENTITY laquo   "&amp;laquo;">
	<!ENTITY raquo   "&amp;raquo;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/page/section" priority="1">
	<div class="colage">
		<xsl:call-template name="crumbs"/>
	</div>
	<div id="page_content">
		<section>
			<h1><xsl:value-of select="$_sec/@title"/></h1>
			<div class="wrap">
				<xsl:apply-templates select="html"/>
				<div class="column_right">
					<div id="map_canvas" style="width: 439px; height: 497px;"></div>
					<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
					<script type="text/javascript">
					function initialize(lat,lng) {     
						var myLatlng = new google.maps.LatLng(lat, lng);
						var myOptions = {
							zoom: 15,
							center: myLatlng,
							mapTypeId: google.maps.MapTypeId.ROADMAP
						}
						var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions); 
						var marker = new google.maps.Marker({
							position: myLatlng,
							map: map
						});
						
						
						var infowindow = new google.maps.InfoWindow({
							content: '<xsl:value-of select="/page/site/@address"/>'
						});
						marker.addListener('click', function() {
							infowindow.open(map, marker);
						});

					};
					$(function(){
						$.post("http://maps.googleapis.com/maps/api/geocode/json?address="+ encodeURIComponent('<xsl:value-of select="/page/site/@address"/>')+"&amp;sensor=false&amp;language=ru",function(data){
							if (data.status=="OK") {
								initialize(data.results[0].geometry.location.lat, data.results[0].geometry.location.lng);
								console.log(data);
							}
						});
					});
					</script>
				</div>
			</div>
		</section>
		<article>
			<h1><xsl:value-of select="form/@title"/></h1>
			<div class="wrap">
				<xsl:apply-templates select="form"/>
				<script type="text/javascript">
/**
 * Плейсхолдер для IE
 */
var isIE=navigator.userAgent.match(/MSIE (\d+)\.(\d+);/);
if(isIE)isIE=isIE[1]&lt;10;
var placeholder_onfocus=isIE
		?function(e){if(!e._value)e._value=$(e).attr('placeholder');if(e._value==e.value)e.value='';}
		:function(){}
	,placeholder_onblur=isIE
		?function(e){if(e.value=='')e.value=e._value;}
		:function(){};
if(isIE){
	$(function(){
		$('input,textarea').each(function(i,e){
			if($(e).attr('placeholder')&amp;&amp;!$(e).attr('value'))$(e).val($(e).attr('placeholder'));
		});
	});
};
				</script>
			</div>
		</article>
		<div class="s1"></div>
		<div class="s2"></div>
	</div><!--page_content-->
</xsl:template>

<!-- INPUT TEXT, EMAIL, PASSWORD -->
<xsl:template match="form//field[@type='text' or @type='email' or @type='password']" priority="1">
	<div class="field {@type}">		
		<input type="{@type}" name="{@name}" id="{@name}" value="{text()}" placeholder="{@label}" onfocus="placeholder_onfocus(this)" onblur="placeholder_onblur (this)">
			<xsl:if test="@class">
				<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@size">
				<xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute>
			</xsl:if>
			<xsl:attribute name="maxlength">
				<xsl:choose>
					<xsl:when test="@maxlength"><xsl:value-of select="@maxlength"/></xsl:when>
					<xsl:otherwise>255</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</input>
	</div>
</xsl:template>

<!-- TEXTAERA -->
<xsl:template match="form//field[@type='textarea']" priority="1">
	<div class="field {@type}">
		<xsl:if test="@desc"><em><xsl:value-of select="@desc"/></em></xsl:if>
		<textarea name="{@name}" id="{@name}" placeholder="{@label}" onfocus="placeholder_onfocus(this)" onblur="placeholder_onblur (this)">
			<xsl:attribute name="cols"><xsl:choose>
				<xsl:when test="@cols"><xsl:value-of select="@cols"/></xsl:when>
				<xsl:when test="@size"><xsl:value-of select="@size"/></xsl:when>
				<xsl:otherwise>40</xsl:otherwise>
			</xsl:choose></xsl:attribute>
			<xsl:attribute name="rows"><xsl:choose>
				<xsl:when test="@rows"><xsl:value-of select="@rows"/></xsl:when>
				<xsl:otherwise>3</xsl:otherwise>
			</xsl:choose></xsl:attribute>
			<xsl:choose>
			<xsl:when test="string-length(text())"><xsl:value-of select="text()"/></xsl:when>
			<xsl:otherwise><xsl:comment/></xsl:otherwise>
		</xsl:choose></textarea>
		<xsl:call-template name="attach"/>
	</div>
</xsl:template>

<!-- CAPTCHA -->
<xsl:template match="form//field[@type='captcha']" priority="1">
	<div class="field {@type}">		
		<img width="261" height="30" alt="Check"><xsl:attribute name="src">
		<xsl:choose>
				<xsl:when test="@src"><xsl:value-of select="@src"/></xsl:when>
				<xsl:otherwise>userfiles/cptch.jpg</xsl:otherwise>
			</xsl:choose>
			<xsl:text>?x=</xsl:text>
			<xsl:value-of select="generate-id()"/>
		</xsl:attribute></img>
		<input type="text" name="{@name}" id="{@name}" size="4" maxlength="3" placeholder="{@label}" onfocus="placeholder_onfocus(this)" onblur="placeholder_onblur (this)" />
	</div>
</xsl:template>

</xsl:stylesheet>