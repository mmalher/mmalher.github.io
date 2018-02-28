<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="game">
        <game>
            <game_info>
                <date>
                    <xsl:value-of select="@date"/>
                </date>
                <venue>
                    <xsl:value-of select="@venue"/>
                </venue>
            </game_info>
            <xsl:apply-templates/>
        </game>

    </xsl:template>



    <xsl:template match="team">
        <team>
            <team_name>
                <xsl:value-of select="@name"/>
            </team_name>

            <personal>
                <xsl:apply-templates/>
            </personal>
        </team>
    </xsl:template>

    <xsl:template match="player">

        <player>
            <number>
                <xsl:value-of select="@num"/>
            </number>
            <boxname>
                <xsl:value-of select="@boxname"/>
            </boxname>
            <position>
                <xsl:value-of select="@position"/>
            </position>
            <xsl:choose>
                <xsl:when test="@position = 'P'">
                    <era>
                        <xsl:value-of select="@era"/>
                    </era>
                </xsl:when>
                <xsl:otherwise>

                    <avg>
                        <xsl:value-of select="@avg"/>
                    </avg>
                </xsl:otherwise>
            </xsl:choose>
            <hr>
                <xsl:value-of select="@hr"/>
            </hr>
            <rbi>
                <xsl:value-of select="@rbi"/>
            </rbi>
            <xsl:choose>
                <xsl:when test="@bat_order > 0">
                    <bat_order>
                        <xsl:value-of select="@bat_order"/>
                    </bat_order>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>


            <xsl:apply-templates/>
        </player>
    </xsl:template>

    <!-- <xsl:template match="player">
    <player>
        <number><xsl:value-of select="@num"/></number>
        <boxname><xsl:value-of select="@boxname"/></boxname>
        <position><xsl:value-of select="@position"/></position>
        <xsl:choose>
            <xsl:when test="@position = 'P'">
                <era>
                    <xsl:value-of select="@era"/>
                </era>
            </xsl:when>
            <xsl:otherwise>
                <avg>
                    <xsl:value-of select="@avg"/>
                </avg>
            </xsl:otherwise>
        </xsl:choose>
        
        <hr><xsl:value-of select="@hr"/></hr>
        <rbi><xsl:value-of select="@rbi"/></rbi>
        <xsl:choose>
            <xsl:when test="@bat_order > 0">
                <bat_order><xsl:value-of select="@bat_order"/></bat_order>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
        
        
        <xsl:apply-templates/></player>
</xsl:template> -->

    <xsl:template match="coach">
        <coach>
            <number>
                <xsl:value-of select="@num"/>
            </number>
            <name>
                <xsl:value-of select="@first | @last"/>
            </name>
            <position>
                <xsl:value-of select="@position"/>
            </position>
        </coach>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="umpire">
        <umpire>
            <name>
                <xsl:value-of select="@name"/>
            </name>
            <position>
                <xsl:value-of select="@position"/>
            </position>
        </umpire>
    </xsl:template>

</xsl:stylesheet>
