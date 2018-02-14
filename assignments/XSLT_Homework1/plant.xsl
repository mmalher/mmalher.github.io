<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>

<xsl:template match="CATALOG">
    <html>
        <head>
            <title>Plant Catalog</title>
            <link rel="stylesheet" type="text/css" href="/css/main.css"/>
        </head>
        <body>
            <h1>Matt's Potastic Plants</h1>
            <p>We have a lot of plants at our store, here is some information about them</p>
            <table style="width:100%">
                <tr>
                    <th>Common Name</th>
                    <th>Botantical Name</th>
                    <th>Zone</th>
                    <th>Light</th>
                    <th>Price</th>
                    <th>Availability</th>
                </tr>
            
            <xsl:apply-templates/>
            </table>  
        </body>
        
    </html>
</xsl:template>

    
 <xsl:template match="PLANT">
    
        
        <tr><xsl:apply-templates/></tr>
        
</xsl:template> 


<xsl:template match="PLANT/child::*">
    
    <td><xsl:apply-templates/></td>
</xsl:template>    
    
</xsl:stylesheet>