<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="game">
        <html>
            <head>
                <title>Minnesota Twins at New York Yankees 4/4/2011</title>
                <link rel="stylesheet" type="text/css" href="style2.css"/>
            </head>
            <body>
               
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="game_info">
        <div id="matchup"> <img src="twin.png"/> versus <img src="yank.jpg"/></div>
        <h1><xsl:apply-templates/></h1>
        <p>The Minnesota Twins travel to New York to face the Yankees. The umpires for the game include:
            Dan Bellino at home, Brian Gorman at first, Larry Vanover at second, and Tony Randazzo at third</p>
    </xsl:template>
    
    <xsl:template match="umpires">
    </xsl:template> 
    <xsl:template match="team">
        <table width="100%">
            <xsl:apply-templates/>  
        </table>
    </xsl:template>
    
    <xsl:template match="team_name">
        <tr>
        <th colspan="7">
            <xsl:apply-templates/>
        </th>
        </tr>
        <tr>
            <th colspan="7">Bench</th>
        </tr>
    </xsl:template>

    
    
    <xsl:template match="/game/team[1]/personal[1]/player[16]">
    <tr><th colspan="7">Starters</th></tr>
    <tr><th>Number</th>
        <th>Name</th>
        <th>Position</th>
        <th>AVG</th>
        <th>HR</th>
        <th>RBI</th></tr>
    <tr><xsl:apply-templates/></tr>
</xsl:template>

<xsl:template match="/game/team[1]/personal[1]/player[15]">
    <tr><th colspan="7">Pitchers</th></tr>
    <tr><th>Number</th>
        <th>Name</th>
        <th>Position</th>
        <th>ERA</th>
        <th>HR</th>
        <th>RBI</th></tr>
    <tr><xsl:apply-templates/></tr>
</xsl:template>
    
<xsl:template match="/game/team[1]/personal[1]/coach[5]">
    <tr><th colspan="7">Coaches</th></tr>
    <tr><th>Number</th>
        <th>Name</th>
        <th colspan="4">Position</th></tr>
</xsl:template>    


    <xsl:template match="/game/team[2]/personal[1]/player[24]">
        <tr><th colspan="7">Starters</th></tr>
        <tr><th>Number</th>
            <th>Name</th>
            <th>Position</th>
            <th>AVG</th>
            <th>HR</th>
            <th>RBI</th></tr>
        <tr><xsl:apply-templates/></tr>
    </xsl:template>
    
    <xsl:template match="/game/team[2]/personal[1]/player[5]">
        <tr><th colspan="7">Pitchers</th></tr>
        <tr><th>Number</th>
            <th>Name</th>
            <th>Position</th>
            <th>ERA</th>
            <th>HR</th>
            <th>RBI</th></tr>
        <tr><xsl:apply-templates/></tr>
    </xsl:template>
    
    <xsl:template match="/game/team[2]/personal[1]/coach[1]">
        <tr><th colspan="7">Coaches</th></tr>
        <tr><th>Number</th>
            <th>Name</th>
            <th colspan="4">Position</th></tr>
    </xsl:template>




<xsl:template match="personal">
    <xsl:copy>
        <xsl:apply-templates select="player">
            <xsl:sort select="era" order="ascending" data-type="number"/>
            <xsl:sort select="bat_order" order="ascending" data-type="number"/>
            <xsl:sort select="position = 'P'" order="ascending" data-type="text"></xsl:sort>
        </xsl:apply-templates>
        <xsl:apply-templates select="coach">
            <xsl:sort select="number" order="ascending" data-type="number"/>
        </xsl:apply-templates>
    </xsl:copy>
</xsl:template>


<xsl:template match="player|coach">
   
    <tr><xsl:apply-templates/></tr>
</xsl:template>
    
    

<xsl:template match="player/number|boxname|position|avg|era|hr|rbi">
    <td><xsl:apply-templates/></td>
</xsl:template>
    
<xsl:template match="coach/number|name">
    <td><xsl:apply-templates/></td>
</xsl:template>

<xsl:template match="coach/position">
<td colspan="4"><xsl:apply-templates/></td>
</xsl:template>

<xsl:template match="bat_order">
    
</xsl:template>
    
</xsl:stylesheet>