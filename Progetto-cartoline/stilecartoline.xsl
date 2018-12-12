<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" />
        <xsl:template match="/">
            <html>
                <head>
                    <title>
                       <xsl:value-of select="//tei:titleStmt/tei:title"/>
                    </title>
                    <script src="jquery-3.3.1.min.js" type="text/javascript"></script>
                    <script type="text/javascript" src="cartoline.js"></script>
                    <style>
                        body{
                            background-image: url('papiro.jpg');
                            background-size: cover;
                            height: 100%;
                        }
                        div{
                            background-color: rgba(255,255,255,0.6);
                            
                        }
                        h1{
                            font-family: 'Trebuchet MS';
                            font-size: 2.5em;
                            text-align: center;
                        }
                        h3{
                            font-family: 'Trebuchet MS';
                            font-size: 1.5em;
                        }
                        p{
                            font-family: 'Trebuchet MS';
                            font-size: 1em
                        }
                        p.testo{
                            text-align: left;
                            cursor: pointer
                        }
                        .right{
                            float: right;
                            width: 44%;
                            padding: 2%;
                            margin: 1%
                        }
                        .left{
                            float: left;
                            width: 44%;
                            padding: 2%;
                            margin: 1%
                        }
                        #cura{
                            font-family: 'Courier New';
                            text-align: right;
                        }
                        #info{
                            test-align: left
                        }
                        #retroI{
                            margin-top: 10%
                        }
                    </style>
                </head>
                <body>
                    <div id="intestazione">
                        <h1 style="text-align:center"><xsl:value-of select="//tei:titleStmt/tei:title"/></h1>
                        <h3 id="cura">
                            A cura di: <xsl:value-of select="//tei:titleStmt/tei:respStmt/tei:name[@xml:id='FM']"/> e <xsl:value-of select="//tei:titleStmt/tei:respStmt/tei:name[@xml:id='IV']"/>
                        </h3>
                    </div>
                    <div>
                        <h3 id="info">
                            Cliccare sul testo o sulla cartolina in corrispondenza del testo
                        </h3>
                    </div>
                    <div id="fronteI" style="float: left; clear:both; position: relative">                        
                        <img><xsl:attribute name="src"><xsl:value-of select="//tei:figure/tei:graphic/[@url]"/></xsl:attribute></img>
                        <xsl:for-each select="//tei:surface[@n='1']//tei:zone">
                            <div class="line">
                                <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                <xsl:attribute name="style">border: 0px; cursor: pointer; background-color:rgba(0,0,0,0); position: absolute; left:<xsl:value-of select="@ulx"/>px; top:<xsl:value-of select="@uly"/>px; height:<xsl:value-of select="(@lry)-(@uly)"/>px; width: <xsl:value-of select="((@lrx)-(@ulx))"/>px</xsl:attribute>    
                            </div>
                        </xsl:for-each>
                    </div>
                    <div id="fronteT" style="width: 45%; float: right; padding: 2%; margin-top: 150px">
                        <p><xsl:value-of select="//tei:figDesc"/></p>
                        <p class="testo"><xsl:attribute name="id"><xsl:value-of select="//tei:figure//tei:head/@facs"/></xsl:attribute><xsl:value-of select="//tei:figure//tei:head"/></p>
                    </div>
                    <div>
                        <div id="retroI" style=" float: left; clear:both; position: relative">
                            <img><xsl:attribute name="src"><xsl:value-of select="//tei:surface[@n='2']//tei:graphic/[@url]"/></xsl:attribute></img>
                            <xsl:for-each select="//tei:surface[@n='2']//tei:zone">
                                <div class="line">
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                    <xsl:attribute name="style">border: 0px; cursor: pointer; background-color:rgba(0,0,0,0); position: absolute; left:<xsl:value-of select="@ulx"/>px; top:<xsl:value-of select="@uly"/>px; height:<xsl:value-of select="(@lry)-(@uly)"/>px; width: <xsl:value-of select="((@lrx)-(@ulx))"/>px</xsl:attribute>    
                                </div>
                            </xsl:for-each>
                        </div>
                        <div id="retroT" style="width: 45%; float: right; padding: 2%; margin-top:3%">
                            <div class="left">
                                <h3>Messaggio:</h3>
                                <xsl:for-each select="(//tei:div[@type='message']/tei:p)">
                                    <p class="testo">
                                        <xsl:attribute name="id"><xsl:value-of select="@facs"/></xsl:attribute>
                                        <xsl:apply-templates/>
                                    </p>
                                </xsl:for-each>
                                <p class="testo"> <xsl:attribute name="id"><xsl:value-of select="//tei:signed/@facs"/></xsl:attribute><xsl:value-of select="//tei:signed"/></p>
                            </div>
                            <div class="right">
                                <h3>Destinazione:</h3>
                                <xsl:for-each select="(//tei:div[@type='destination']//tei:addrLine)">
                                    <p class="testo">
                                        <xsl:attribute name="id"><xsl:value-of select="@facs"/></xsl:attribute>
                                        <xsl:apply-templates/>
                                    </p>
                                </xsl:for-each>
                            </div>
                            <div class="left">
                                <h3>Timbro e francobollo:</h3>
                                <p class="testo">
                                    <xsl:attribute name="id"><xsl:value-of select="//tei:div[@type='destination']//tei:stamp[@type='postmark']/[@facs]"/></xsl:attribute>
                                    <xsl:for-each select="(//tei:div[@type='destination']//tei:stamp)">                                        
                                            <xsl:apply-templates/>
                                    </xsl:for-each>
                                </p>
                            </div>
                            <div class="right">
                                <h3>Caratteri non manoscritti:</h3>
                                <xsl:for-each select="//tei:div[@type='printed']//tei:p">
                                    <p class="testo">
                                        <xsl:attribute name="id"><xsl:value-of select="@facs"/></xsl:attribute>
                                        <xsl:apply-templates/>
                                    </p>
                                </xsl:for-each>
                            </div>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:template>
        <xsl:template match="*[@rend='exp']">
            <sup><xsl:value-of select="."/></sup>
        </xsl:template>
        <xsl:template match="*[@rend='dep']">
            <sub><xsl:value-of select="."/></sub>
        </xsl:template>
</xsl:stylesheet>