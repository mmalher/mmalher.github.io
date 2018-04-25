<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    
    
    <xsl:template match="teiHeader | back" />


    <xsl:template match="div|titlePage" mode="html">
        <xsl:variable name="arts">
            <xsl:value-of select="head[1]"/>
        </xsl:variable>
        <xsl:result-document href="{concat('/Users/Matt/Desktop/VAC5744/OEBPS/',$arts,'.html')}">

        <html>
            <head>
                <title>
                    <xsl:value-of select="//titlePage/docTitle[1]/titlePart[1]"/>
                </title>
                <link rel="stylesheet" type="text/css" href="mystyle.css"/>
            </head>
            <body>
                <xsl:apply-templates mode="html"/>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//emph" mode="html">
        <i>
            <xsl:apply-templates mode="html"/>
        </i>
    </xsl:template>
    <xsl:template match="//div/head" mode="html">
        <h2>
            <xsl:apply-templates mode="html"/>
        </h2>
    </xsl:template>
    <xsl:template match="//p | figure/p" mode="html">
        <p>
            <xsl:apply-templates mode="html"/>
        </p>
    </xsl:template>
    <xsl:template match="titlePart | docAuthor | pubPlace | publisher | docDate" mode="html">
        <h1>
            <xsl:apply-templates  mode="html"/>
        </h1>
    </xsl:template>

    <xsl:template match="//pb" mode="html">

        <xsl:choose>
        <xsl:when test="contains(@n, 'Illustration')">
            <p><img src="http://purl.dlib.indiana.edu/iudl/wright/large/{@xml:id}" width="500"
                height="364"/></p>
        </xsl:when>
            
   <xsl:otherwise>
        <xsl:copy-of select="."/>
    </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="text">
        <xsl:result-document href="{'VAC5744/OEBPS/toc.ncx'}">
            <ncx xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1" xml:lang="en">
                <head>
                    <meta content="VAC5744" name="dtb:uid"/>
                    <meta content="1" name="dtb:depth"/>
                    
                    <meta content="0" name="dtb:totalPageCount"/>
                    <meta content="0" name="dtb:maxPageNumber"/>
                </head>
                <docTitle>
                    <text>Emily, or, The Orphan Sisters</text>
                </docTitle>
                <docAuthor>
                    <text>Barrington, Charles F.</text>
                </docAuthor>
                <navMap>
                     
                    <xsl:apply-templates select="body//div" mode="ncx"/>
                    <xsl:apply-templates select="body" mode="html"/>
                </navMap>
            </ncx>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="body//div" mode="ncx">
        <xsl:variable name="order" select="position()"/>
        <navPoint id="{concat('navpoint-',($order))}" playOrder="{($order)}"
            xmlns="http://www.daisy.org/z3986/2005/ncx/">
            <navLabel xmlns="http://www.daisy.org/z3986/2005/ncx/">
                <text xmlns="http://www.daisy.org/z3986/2005/ncx/">
                    <xsl:value-of select="head[1]"/>
                </text>
            </navLabel>
            <content src="{head[1]}.html"
                xmlns="http://www.daisy.org/z3986/2005/ncx/"/>
        </navPoint>
    </xsl:template>
    
   
</xsl:stylesheet>
