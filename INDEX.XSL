<?xml version="1.0" encoding="Windows-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" encoding="Windows-1251" indent="yes" />
<xsl:strip-space elements="*"/> 

  <xsl:template match="��">
    <xsl:copy>            
       <xsl:apply-templates/>
    </xsl:copy> 
  </xsl:template>

  <xsl:template match="������">
    <xsl:copy>
	<xsl:text> CREATE</xsl:text>
	                 	   
   	  <xsl:choose>
	     	<xsl:when test="@����������='����������'">
			<xsl:text> UNIQUE</xsl:text></xsl:when>
	       	<xsl:when test="@����������='�������������'">
			<xsl:text> ASCENDING</xsl:text></xsl:when>
	        <xsl:when test="@����������='����������'">
			<xsl:text> DESCENDING</xsl:text></xsl:when>
		<xsl:otherwise><xsl:text>������</xsl:text></xsl:otherwise>
          </xsl:choose>

	 <xsl:text> INDEX </xsl:text> <xsl:value-of select="@��������"/>  
	 <xsl:text> ON </xsl:text> 
      
        <xsl:for-each select="ancestor-or-self::*">
		<xsl:value-of select="@���������������"/>
	</xsl:for-each>

	<xsl:text> (</xsl:text>

        <xsl:apply-templates/>  
     </xsl:copy>
  </xsl:template>

  <xsl:template match="�����������"> 
    <xsl:for-each select="@��������"> <xsl:value-of select="."/>
    </xsl:for-each>

    <xsl:if test="position()!=last()">
	<xsl:text>, </xsl:text>
    </xsl:if>  

    <xsl:if test="position()=last()"> 
	<xsl:text> )</xsl:text>
    </xsl:if>  
  </xsl:template>

</xsl:stylesheet>