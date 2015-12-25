<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/page/section" priority="1">
	<xsl:apply-templates select="carousel"/>
	<div id="page_content" class="home">
		<xsl:apply-templates select="/page/news"/>
		<xsl:apply-templates select="html"/>
		<div class="s1"></div>
		<div class="s2"></div>
	</div>
	<xsl:apply-templates select="partners"/>
</xsl:template>

<!-- Карусель -->
<xsl:template match="carousel[row]">
	<script src="js/fm_carousel2.js"></script>
	<section id="slider">
		<xsl:apply-templates select="row/img/preview"/>
		<input type="button" class="next" value="&#160;" onclick="ss.next()"/>
		<input type="button" class="prev" value="&#160;" onclick="ss.prev()"/>
	<script>
		var ss;
		$(function(){
			ss=$('#slider > figure').fmCarousel({
				autorun:true
				,captionPosition:'bottom'
				,useMethod:[
					'blocks02'
					,'blocks01'
					,'verticalCol'
					,'verticalColOpposite'
					,'verticalColLouvers'
					,'horizontalCol'
					,'horizontalColOpposite'
					,'horizontalColLouvers'
				]
				,randomMethod:false
			});
		});
	</script>
	</section>
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
		<h1><xsl:value-of select="@title"/></h1>
		<div class="wrap">
			<xsl:value-of select="text()" disable-output-escaping="yes"/>
			<p class="show_all"><a href="about/">Read more...</a></p>
		</div>
	</article>
</xsl:template>

<!-- Анонсы новостей -->
<xsl:template match="news[row]">
	<section class="news">
		<h1><xsl:value-of select="/page/structure/sec[@id='news']/@title"/></h1>
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
			<p class="more"><a href="news/row{@id}/">Read more</a></p>
		</article>
	</xsl:if>
</xsl:template>
<xsl:template match="news/row/date">
	<time datetime="{@value}"><xsl:value-of select="text()"/></time>
</xsl:template>
<xsl:template match="news/row/title">
	<h1><xsl:value-of select="text()"/></h1>
</xsl:template>
<xsl:template match="news/row/announce">
	<p><xsl:value-of select="text()"/></p>
</xsl:template>
<xsl:template match="news/row/img/preview">
	<img src="{@src}" alt="{ancestor::row/title/text()}" width="{@width}" height="{@height}"/>
</xsl:template>

<!-- Фотогалерея -->
<xsl:template match="section/partners[row]">
	<section class="gallery">
		<h1>Partners</h1>
		<div class="gall_image">
			<div class="button_loopslider-master">
				<button class="button_left"></button>
				<button class="button_right"></button>
			</div>
			<ul id="carousel" class="elastislide-list">
						<xsl:apply-templates select="row/img/preview"/>
			</ul>
		</div>
		<script src="js/carousel.js"></script>
		<script src="js/loopslider-master/jquery.loopslider.js"></script>
		<script type="text/javascript">			
			$(function(){
				$('#carousel').loopslider({
					autoplay: true
					,visibleItems: 6
					,step: 1
					,prevButton: '.button_loopslider-master .button_left'
					,nextButton: '.button_loopslider-master .button_right'
				});
			});		
		</script>
	</section>
</xsl:template>
<xsl:template match="section/partners/row/img/preview">
	<li>
		<a href="{ancestor::row/announce}" target="_blank" title="{ancestor::row/title}" ><img src="{@src}" width="{@width}" height="{@height}" alt="{ancestor::row/title}"/></a>
	</li>
</xsl:template>

</xsl:stylesheet>