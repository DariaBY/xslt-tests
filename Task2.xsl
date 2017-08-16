<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" encoding="UTF-8"/>
    
    <xsl:template name="reverse">
        <xsl:param name="data_string"/>
        <xsl:param name="reversed_data_string"/>
        <xsl:choose>
            <xsl:when test="string-length($data_string) &gt; 0">
                <xsl:call-template name="reverse">
                    <xsl:with-param name="data_string">
                        <xsl:value-of select="substring($data_string,1,string-length($data_string)-1)"/>
                    </xsl:with-param>
                    <xsl:with-param name="reversed_data_string">
                        <xsl:value-of select="concat($reversed_data_string,substring($data_string,string-length($data_string)-1,1))"/>
                    </xsl:with-param>                
                </xsl:call-template>       
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$reversed_data_string" />                
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="root">
        <str1>
		<xsl:call-template name="reverse">
			<xsl:with-param name="data_string">
				<xsl:value-of select="str1"/>
			</xsl:with-param>          
		</xsl:call-template>
        </str1>

        <str2><xsl:value-of select='translate(str2, translate(str2, "1234567890", ""), "")'/></str2>
        
        <str3><xsl:value-of select='translate(str3, "1234567890", "")'/></str3>
        
        <str4><xsl:value-of select='string-length(str4) - string-length(translate(str4, " &#10;", ""))'/></str4>
    </xsl:template>

</xsl:stylesheet>