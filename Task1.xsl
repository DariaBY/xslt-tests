<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" encoding="UTF-8"/>
	<xsl:template name="split_string">
		<xsl:param name="data_string"/>
		<xsl:param name="delimiter" />
		<xsl:choose>
			<xsl:when test="contains($data_string, $delimiter)">
				<li><xsl:value-of select="substring-before($data_string, $delimiter)"/></li>
				<xsl:call-template name="split_string">
					<xsl:with-param name="data_string">
						<xsl:value-of select="substring-after($data_string, $delimiter)"/>
					</xsl:with-param>
					<xsl:with-param name="delimiter">
						<xsl:value-of select="$delimiter"/>
					</xsl:with-param>
				</xsl:call-template>
		    </xsl:when>
		    <xsl:otherwise>
				<xsl:if test="string-length($data_string) &gt; 0">
					<li><xsl:value-of select="$data_string"/></li>
				</xsl:if>
		    </xsl:otherwise>
		</xsl:choose>
	</xsl:template>
		
	<xsl:template match="root">
		<ul>
		<xsl:call-template name="split_string">
			<xsl:with-param name="data_string">
				<xsl:value-of select="data"/>
			</xsl:with-param>
			<xsl:with-param name="delimiter">;</xsl:with-param>
		</xsl:call-template>
		</ul>
	</xsl:template>

</xsl:stylesheet>