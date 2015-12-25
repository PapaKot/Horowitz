<?xml version="1.0" encoding="utf-8"?><!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8"/>

<xsl:template match="form">
	<xsl:variable name="formId">
		<xsl:choose>
			<xsl:when test="@id"><xsl:value-of select="@id"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="generate-id()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="method">
		<xsl:choose>
			<xsl:when test="@method"><xsl:value-of select="@method"/></xsl:when>
			<xsl:otherwise>post</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="class">
		<xsl:choose>
			<xsl:when test="@class"><xsl:value-of select="@class"/></xsl:when>
			<xsl:otherwise>default</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:choose>
		<xsl:when test="message[@type]">
			<xsl:apply-templates select="message[@type]" />
		</xsl:when>
		<xsl:otherwise>
			<form id="{$formId}" class="{$class}" action="{@action}#{$formId}" method="{$method}">
				<xsl:if test="@enctype"><xsl:attribute name="enctype"><xsl:value-of select="@enctype"/></xsl:attribute></xsl:if>
				<xsl:apply-templates select="message"/>
				<xsl:apply-templates select="field | button | group | fieldset | buttongroup"/>
				<input type="hidden" name="id" value="{$_sec/@id}"/>
				<xsl:apply-templates select="param"/>
			</form>
			<xsl:if test="@autocheck">
				<script type="text/javascript">
					<xsl:text>$(function(){try{document.getElementById('</xsl:text>
					<xsl:value-of select="$formId"/>
					<xsl:text>').onsubmit=function(){var p=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;</xsl:text>
					<xsl:apply-templates select=".//field[@check or @type='email' or @type='password_confirm']" mode="fieldcheck"/>
					<xsl:text>return true;}}catch(er){alert(er.message);}});</xsl:text>
				</script>
			</xsl:if>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="form//fieldset">
	<fieldset>
		<xsl:if test="@title">
			<legend><xsl:value-of select="@title" disable-output-escaping="yes"/></legend>
		</xsl:if>
		<xsl:apply-templates select="title | field | button | group | fieldset | buttongroup"/>
	</fieldset>
</xsl:template>

<xsl:template match="form//field[contains(@check,'empty-or-')]" mode="fieldcheck" priority="1">
	<xsl:variable name="or_field_name" select="substring-after(@check,'empty-or-')"/>
	<xsl:variable name="or_field" select="ancestor::form//field[@name=$or_field_name]"/>
	if(!this.<xsl:value-of select="@name"/>.value<xsl:text disable-output-escaping="yes">&amp;&amp;</xsl:text>!this.<xsl:value-of select="$or_field/@name"/>.value){
		alert('<xsl:call-template name="_ln_empty-or_field"><xsl:with-param name="or_field" select="$or_field"/></xsl:call-template>');
		return false;
	};
</xsl:template>
<xsl:template match="form//field[contains(@check,'empty')]" mode="fieldcheck">
	if(!this.<xsl:value-of select="@name"/>.value){alert('<xsl:call-template name="_ln_empty_field"/>');return false;};
</xsl:template>
<xsl:template match="form//field[@type='radio' and contains(@check,'empty')]" mode="fieldcheck" priority="1">
	var res=false,f=this.<xsl:value-of select="@name"/>;
	if(f.length){for(var i in f)if(f[i].checked){res=true;break;}}else res=f.checked;
	if(!res){alert('<xsl:call-template name="_ln_empty_field"/>');return false;};
</xsl:template>
<xsl:template match="form//field[@type='password_confirm']" mode="fieldcheck">
	if(this.<xsl:value-of select="@name"/>.value <xsl:text disable-output-escaping="yes">&amp;&amp;</xsl:text> this.<xsl:value-of select="@name"/>.value!=this.<xsl:value-of select="@name"/>_confirm.value){alert('<xsl:call-template name="_ln_empty_field_confirm"/>');return false;};
</xsl:template>
<xsl:template match="form//field[@type='password_confirm' and contains(@check,'empty')]" mode="fieldcheck" priority="1">
	if(!this.<xsl:value-of select="@name"/>.value){alert('<xsl:call-template name="_ln_empty_field"/>');return false;};
	if(this.<xsl:value-of select="@name"/>.value!=this.<xsl:value-of select="@name"/>_confirm.value){alert('<xsl:call-template name="_ln_empty_field_confirm"/>');return false;};
</xsl:template>
<xsl:template match="form//field[@type='email']" mode="fieldcheck">
	if(<xsl:if test="not(contains(@check,'empty'))">this.<xsl:value-of select="@name"/>.value <xsl:text disable-output-escaping="yes">&amp;&amp;</xsl:text> </xsl:if>!p.test(this.<xsl:value-of select="@name"/>.value)){alert('<xsl:call-template name="_ln_wrong_email"/>');return false;};
</xsl:template>

<xsl:template name="required">
	<xsl:if test="not(contains(@check,'empty-or-')) and contains(@check,'empty')"><span class="required">*</span></xsl:if>
</xsl:template>

<xsl:template match="form/message">
	<div>
		<xsl:attribute name="class">
			<xsl:text>message</xsl:text>
			<xsl:if test="@type">
				<xsl:text> </xsl:text>
				<xsl:value-of select="@type"/>
			</xsl:if>
		</xsl:attribute>
		<xsl:value-of select="text()" disable-output-escaping="yes"/>
	</div>
</xsl:template>

<xsl:template match="form/param">
	<input type="hidden" name="{@name}" value="{@value}"/>
</xsl:template>

<xsl:template match="form//field[@type='text' or @type='email' or @type='password']">
	<div class="field {@type}">
		<label for="{@name}"><xsl:value-of select="@label"/><xsl:call-template name="required"/></label>
		<input type="{@type}" name="{@name}" id="{@name}" value="{text()}">
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

<xsl:template match="form//field[@type='password_confirm']">
	<div class="field password">
		<label for="{@name}"><xsl:value-of select="@label"/><xsl:call-template name="required"/></label>
		<input type="password" name="{@name}" id="{@name}" value="{text()}" size="20" maxlength="31"/>
	</div>
	<div class="field password">
		<label for="{@name}_confirm"><xsl:value-of select="@label_confirm"/><xsl:call-template name="required"/></label>
		<input type="password" name="{@name}_confirm" id="{@name}_confirm" value="{text()}" size="20" maxlength="31"/>
	</div>
</xsl:template>

<!-- CHECKBOX -->
<xsl:template match="form//field[@type='checkbox']">
	<div class="field {@type}">
		<input type="{@type}" name="{@name}" id="{@name}">
			<xsl:if test="@checked"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if>
			<xsl:attribute name="value"><xsl:choose>
				<xsl:when test="@value"><xsl:value-of select="@value"/></xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose></xsl:attribute>
		</input>
		<label for="{@name}"><xsl:value-of select="@label" disable-output-escaping="yes" /><xsl:call-template name="required"/></label>
	</div>
</xsl:template>

<!-- RADIO -->
<xsl:template match="form//field[@type='radio']">
	<fieldset>
	<xsl:if test="@label">
		<legend>
			<xsl:value-of select="@label"/><xsl:call-template name="required"/>
		</legend>
	</xsl:if>
		<xsl:apply-templates/>
		<xsl:call-template name="attach"/>
	</fieldset>
</xsl:template>
<xsl:template match="form//field[@type='radio']/option">
	<div class="field radio">
		<input type="radio" name="{parent::field/@name}" id="{@id}">
			<xsl:attribute name="value"><xsl:choose>
				<xsl:when test="@value"><xsl:value-of select="@value"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise>
			</xsl:choose></xsl:attribute>
			<xsl:if test="@checked">
				<xsl:attribute name="checked">checked</xsl:attribute>
			</xsl:if>
		</input>
		<xsl:text>&#160;</xsl:text>
		<label for="{@id}"><xsl:value-of select="text()"/></label>
	</div>
</xsl:template>

<!-- SELECT -->
<xsl:template match="form//field[@type='select']">
	<div class="field {@type}">
		<label for="{@name}"><xsl:value-of select="@label"/><xsl:call-template name="required"/></label>
		<select name="{@name}" id="{@name}" size="1">
			<xsl:apply-templates/>
		</select>
	</div>
</xsl:template>
<xsl:template match="form//field[@type='select']/option">
	<option>
		<xsl:attribute name="value">
			<xsl:choose>
				<xsl:when test="@value"><xsl:value-of select="@value"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:if test="@value = parent::field/@value">
			<xsl:attribute name="selected">selected</xsl:attribute>
		</xsl:if>
		<xsl:value-of select="text()"/>
	</option>
</xsl:template>

<!-- TEXTAERA -->
<xsl:template match="form//field[@type='textarea']">
	<div class="field {@type}">
		<label for="{@name}">
			<xsl:value-of select="@label"/>
			<xsl:call-template name="required"/>
		</label>
		<xsl:if test="@desc"><em><xsl:value-of select="@desc"/></em></xsl:if>
		<textarea name="{@name}" id="{@name}">
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

<!-- File -->
<xsl:template match="/page/section/form//field[@type='file']">
	<div class="field {@type}">
		<label for="{@name}"><xsl:value-of select="@label"/><xsl:call-template name="required"/></label>
		<input type="{@type}" name="{@name}" id="{@name}" />
	</div>
</xsl:template>

<!-- RECAPTCHA -->
<xsl:template match="form//field[@type='recaptcha']">
	<div class="field {@type}">
		<div class="g-recaptcha" data-sitekey="{@sitekey}"></div>
	</div>
	<script src='https://www.google.com/recaptcha/api.js'></script>
</xsl:template>

<!-- CAPTCHA -->
<xsl:template match="form//field[@type='captcha']">
	<div class="field {@type}">
		<label class="{@class}" for="{@name}">
			<xsl:value-of select="@label" disable-output-escaping="yes"/><xsl:call-template name="required"/>
		</label>
		<img width="200" height="25" alt="check"><xsl:attribute name="src">
		<xsl:choose>
				<xsl:when test="@src"><xsl:value-of select="@src"/></xsl:when>
				<xsl:otherwise>userfiles/cptch.jpg</xsl:otherwise>
			</xsl:choose>
			<xsl:text>?x=</xsl:text>
			<xsl:value-of select="generate-id()"/>
		</xsl:attribute></img>
		<input type="text" name="{@name}" id="{@name}" size="4" maxlength="3" />
	</div>
</xsl:template>

<xsl:template match="form//buttongroup">
	<div class="button">
		<div class="desc"><span class="required">*</span> – mandatory fields</div>
		<xsl:apply-templates select="button"/>
	</div>
</xsl:template>
<xsl:template match="form//buttongroup/button[@type='submit']">
	<input type="{@type}" value="{@value}" class="button" name="{@name}">
		<xsl:if test="string-length(@class)">
			<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
		</xsl:if>
	</input>
</xsl:template>

<xsl:template match="form//buttongroup/button[@type='reset']">
	<input type="{@type}" value="{@value}" class="button" name="{@name}">
		<xsl:if test="string-length(@class)">
			<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
		</xsl:if>
	</input>
</xsl:template>

<xsl:template name="attach">
	<xsl:if test="@attach">
		<div class="attach"><input type="file" name="{@name}_attach" id="{@name}_attach" /></div>
	</xsl:if>
</xsl:template>

<xsl:template name="_ln_empty_field">field "<xsl:value-of select="@label"/>" required</xsl:template>
<xsl:template name="_ln_empty_field_confirm">Passwords are not equal</xsl:template>
<xsl:template name="_ln_empty-or_field"><xsl:param name="or_field"/>"<xsl:value-of select="@label"/>" or "<xsl:value-of select="$or_field/@label"/>" required</xsl:template>
<xsl:template name="_ln_wrong_email">E-mail address in the field "<xsl:value-of select="@label"/>"\nis invalid</xsl:template>

</xsl:stylesheet>