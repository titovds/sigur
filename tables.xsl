<?xml version="1.0" encoding="Windows-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" encoding="Windows-1251"  indent="yes"/>
 

  <xsl:template match="��">  
    <xsl:copy>
       <xsl:apply-templates/> 
    </xsl:copy>
  </xsl:template>


  <xsl:template match="�������">    
    <xsl:text> CREATE TABLE </xsl:text>
    <xsl:value-of select="@���������������"/><xsl:apply-templates/>
    <xsl:text> (</xsl:text><xsl:apply-templates/>
  </xsl:template>


  <xsl:template match="����">      
	<xsl:value-of select="@������������"/><xsl:apply-templates/> 

     	<xsl:choose>
       		<xsl:when test="@���='�����������������'"><xsl:text> integer</xsl:text></xsl:when>
        	<xsl:when test="@���='���������'"><xsl:text> TIMESTAMP</xsl:text></xsl:when>
   			<xsl:when test="@���='Binary'"><xsl:text> Blob(0,2)</xsl:text></xsl:when>
        	<xsl:when test="@���='������'"><xsl:text> char </xsl:text>(<xsl:value-of select="@�����"/>)</xsl:when>
   			<xsl:otherwise>���������</xsl:otherwise>
     	</xsl:choose>   


  		<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>

  		<xsl:if test="@����='��'">
      		<xsl:text> PRIMARY KEY (</xsl:text>
      		<xsl:value-of select="@������������"/>
      		<xsl:text> ) </xsl:text>
  		<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>   
   	</xsl:if>

  
	<xsl:if test="position()=last()"> <xsl:text> )</xsl:text></xsl:if>  

  </xsl:template>  

</xsl:stylesheet>


