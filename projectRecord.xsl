<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        
        <head>
            <title>Project Record</title>
            <meta http-equiv="Content-Type" content="text/html;UTF-8"/>
        </head>
        <body>
            <center><h1>Project Record</h1></center>
            <hr/>
            <xsl:apply-templates select="sip/metadata"/>
            <hr/>
            <h3>WORKTEAM: </h3>
            <xsl:apply-templates select="sip/workteam"/>
            <hr/>
            <h3>ABSTRACT: </h3>
            <xsl:apply-templates select="sip/abstract"/>
            <hr/>
            <h3>DELIVERABLES: </h3>
            <xsl:apply-templates select="sip/deliverables"/>
        </body>
        
    </xsl:template>
    
    <xsl:template match="metadata">
        <table border="0" width="100%">
            <tr>
                <xsl:apply-templates select="keyname"/>
                <xsl:apply-templates select="sdate"/>
            </tr>
            <tr>
                <xsl:apply-templates select="title"/>
                <xsl:apply-templates select="edate"/>
            </tr>
            <xsl:apply-templates select="subtitle"/>
            <tr>
                <td>                    
                    <b>SUPERVISORS: </b> 
                    <ul>
                        <xsl:apply-templates select="supervisors"/>
                    </ul>
                </td>
            </tr>
        </table>
    </xsl:template>
    
    <!-- .........................METADATA......................... -->
    
    <xsl:template match="keyname">
        <td>
            <b>KEYNAME: </b> <xsl:value-of select="."/>
        </td>
    </xsl:template>
    
    <xsl:template match="sdate">
        <td>
            <b>BEGIN DATE: </b> <xsl:value-of select="."/>
        </td>
    </xsl:template>
    
    <xsl:template match="title">
        <td>
            <b>TITLE: </b> <xsl:value-of select="."/>
        </td>
    </xsl:template>
    
    <xsl:template match="edate">
        <td>
            <b>END DATE: </b> <xsl:value-of select="."/>
        </td>
    </xsl:template>
    
    <xsl:template match="subtitle">
        <tr>
            <td>
                <b>SUBTITLE: </b> <xsl:value-of select="."/>
            </td>
        </tr>
    </xsl:template>
    
    
    <xsl:template match="supervisors">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="supervisor">        
        <li>
            <xsl:if test="./webpage">
                <a href="{./webpage}"><xsl:value-of select="name"/></a>
            </xsl:if>
            
            <xsl:if test="not(./webpage)">
                <xsl:value-of select="name"/>
            </xsl:if>            
            
            <ul>
                <li>
                    <a href="mailto:{./email}"><xsl:value-of select="email"/></a>
                </li>
            </ul>   
        </li>     
    </xsl:template>
    
    <!-- .........................WORKTEAM......................... -->
    
    <xsl:template match="workteam">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="member">
        <li>
            <xsl:value-of select="./name"/> - <xsl:value-of select="./id"/>
            <ul>
                <li>
                    <a href="mailto:{./email}"><xsl:value-of select="email"/></a>
                </li>
            </ul>
        </li>
    </xsl:template>
    
    <!-- .........................Abstract......................... -->
    
    <xsl:template match="abstract">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="b">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    
    <xsl:template match="i">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
    <xsl:template match="u">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    
    <xsl:template match="ul">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="ol">
        <ol>
            <xsl:apply-templates/>
        </ol>
    </xsl:template>
    
    <xsl:template match="li">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="xref">
        <a href="{@url}"><xsl:value-of select="."/></a>            
    </xsl:template>
    
    <xsl:template match="iref">
        <a href="#{@url}"><xsl:value-of select="."/></a>            
    </xsl:template>
    
    <!-- .........................Deliverables......................... -->
    
    <xsl:template match="deliverables">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="deliverable[@format]">
        <li>
            <a href="{@path}"><xsl:value-of select="."/> (<xsl:value-of select="./@format"/>)</a>
        </li>
    </xsl:template> 
    
    <xsl:template match="deliverable[not(@format)]">
        <li>
            <a href="{@path}"><xsl:value-of select="."/></a>            
        </li>
    </xsl:template>
    
    
</xsl:stylesheet>