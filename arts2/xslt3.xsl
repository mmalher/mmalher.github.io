<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes"/>
    
    
       
    

    <xsl:template match="teiHeader | front | pb | back"/>

<xsl:template match="div">
   <xsl:variable name="arts">
        <xsl:value-of select="@id"/>
    </xsl:variable>
    <xsl:result-document href="{concat('/Users/Matt/Desktop/arts2/',$arts,'.html')}">
  
    <html>
        <head>
            <title><xsl:value-of select="head"/></title>
            <link rel="stylesheet" type="text/css" href="style2.css"/>
        </head>
        <body>
            <xsl:apply-templates/>
        </body>
    </html>
    
  </xsl:result-document>
</xsl:template>
<xsl:template match="text/body">
    <articles><xsl:apply-templates/></articles>
</xsl:template>
    <xsl:template match="head">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
<xsl:template match="div/p[1]">
    <p id="first"><xsl:apply-templates/></p>
</xsl:template>
    
    <xsl:template match="p">
    <p><xsl:apply-templates/></p>
</xsl:template>
    <xsl:template match="hi">
        <xsl:choose>
            <xsl:when test="@rend = 'i'">
                <i>
                    <xsl:value-of select="text()"/>
                </i>
            </xsl:when>
            <xsl:when test="@rend = 'b'">
                <p id="marg"><b>
                    <xsl:value-of select="text()"/>
                </b></p>
            </xsl:when>
            <xsl:when test="@rend='u'">
                <u><xsl:value-of select="text()"/></u>
            </xsl:when>
            <xsl:when test="@rend='sup'">
                <sup><xsl:value-of select="text()"/></sup>
            </xsl:when>
        </xsl:choose>
       
    </xsl:template>
<xsl:template match="/journal_issue/text[1]/body[1]/div[3]/p[4]/text[1]/body[1]/div[1]">
    <p><xsl:apply-templates/></p>
</xsl:template>
<xsl:template match="list">
    <ol>
        <xsl:apply-templates/>
    </ol>
</xsl:template>
    
<xsl:template match="item">
    <li><xsl:apply-templates/></li>
</xsl:template>    
    
   

</xsl:stylesheet>
