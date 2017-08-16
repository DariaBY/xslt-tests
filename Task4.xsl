<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="text" encoding="UTF-8"/>

<xsl:template match="list">
    <xsl:for-each select="item">
        <xsl:sort select="text()"/>
        <xsl:choose>
            <xsl:when test="preceding-sibling::item[substring(text(), 1,1)=substring(current()/text(), 1,1)]"/>
            <xsl:otherwise>
                <xsl:value-of select="concat(substring(text(), 1,1), '&#xa;')"/>
                    <xsl:for-each select="/list/item[substring(text(), 1,1)=substring(current()/text(), 1,1)]"><xsl:sort select="text()"/>
                    <xsl:value-of select="concat(text(), '&#xa;')"/>
                    </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>