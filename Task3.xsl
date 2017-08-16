<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" encoding="UTF-8"/>
    
    <xsl:template match="node()|@*" name="identity">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/root">
        <root>
        <xsl:for-each select="*">
            <cell><xsl:apply-templates select="."/></cell>
        </xsl:for-each>
        </root>
    </xsl:template>

    <xsl:template match="strong">
    <b><xsl:apply-templates select="node()|@*"/></b>
    </xsl:template>

    <xsl:template match="em|address">
    <i><xsl:apply-templates select="node()|@*"/></i>
    </xsl:template>

    <xsl:template match="pre"/>
    
    <xsl:template match="h1">
    <paragraph style="font-size:18; font-style:bold;">
    <xsl:apply-templates select="node()|@*"/>
    </paragraph>
    </xsl:template>

    <xsl:template match="h2">
    <paragraph style="font-size:14; font-style:bold;">
    <xsl:apply-templates select="node()|@*"/>
    </paragraph>
    </xsl:template>

    <xsl:template match="h3">
    <paragraph style="font-size:12; font-style:bold;">
    <xsl:apply-templates select="node()|@*"/>
    </paragraph>
    </xsl:template>

    <xsl:template match="h4">
    <paragraph style="font-size:10; font-style:bold;">
    <xsl:apply-templates select="node()|@*"/>
    </paragraph>
    </xsl:template>

    <xsl:template match="h5">
    <paragraph style="font-size:8; font-style:bold;">
    <xsl:apply-templates select="node()|@*"/>
    </paragraph>
    </xsl:template>

    <xsl:template match="h6">
    <paragraph style="font-size:6; font-style:bold;">
    <xsl:apply-templates select="node()|@*"/>
    </paragraph>
    </xsl:template>

    <xsl:template match="@style">

        <xsl:choose>
            <xsl:when test=". = 'font-size: xx-small;'">
                <xsl:attribute name="style">
                    <xsl:text>font-size:8;</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'font-size: x-small;'">
                <xsl:attribute name="style">
                    <xsl:text>font-size:10;</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'font-size: small;'">
                <xsl:attribute name="style">
                    <xsl:text>font-size:12;</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'font-size: medium;'">
                <xsl:attribute name="style">
                    <xsl:text>font-size:14;</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'font-size: large;'">
                <xsl:attribute name="style">
                    <xsl:text>font-size:18;</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'font-size: x-large;'">
                <xsl:attribute name="style">
                    <xsl:text>font-size:24;</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'font-size: xx-large;'">
                <xsl:attribute name="style">
                    <xsl:text>font-size:36;</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="style">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template match="ul">
    <list numbered="false">
    <xsl:apply-templates select="node()|@*"/>
    </list>
    </xsl:template>

    <xsl:template match="ol">
    <list numbered="true">
    <xsl:apply-templates select="node()|@*"/>
    </list>
    </xsl:template>

    <xsl:template match="li">
    <list-item><xsl:apply-templates select="node()|@*"/></list-item>
    </xsl:template>

    <xsl:template match="text()">
    <xsl:value-of select="translate(., '∑©¶Œ', '')"/>
    </xsl:template>    

</xsl:stylesheet>