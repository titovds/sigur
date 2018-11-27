<?xml version="1.0" encoding="Windows-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" encoding="Windows-1251" indent="yes" />
<xsl:strip-space elements="*"/>

  <xsl:template match="БД">
    <xsl:copy>
       <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="ИНДЕКС">
    <xsl:copy>
	<xsl:text> CREATE</xsl:text>

   	  <xsl:choose>
	     	<xsl:when test="@ТипИндекса='Уникальный'">
			<xsl:text> UNIQUE</xsl:text></xsl:when>
      </xsl:choose>

	 <xsl:text> INDEX </xsl:text> <xsl:value-of select="@Название"/>
	 <xsl:text> ON </xsl:text>

     <xsl:for-each select="ancestor-or-self::*">
		<xsl:value-of select="@НазваниеТаблицы"/>
     </xsl:for-each>

	<xsl:text> (</xsl:text>

        <xsl:apply-templates/>
     </xsl:copy>
  </xsl:template>

  <xsl:template match="ПОЛЕИНДЕКСА">
    <xsl:for-each select="@Название"> <xsl:value-of select="."/>
    </xsl:for-each>

  
   <xsl:for-each select="ancestor-or-self::*">
      <xsl:choose>
	       	<xsl:when test="@ТипИндекса='ПоВозрастанию'">
			<xsl:text> ASC</xsl:text></xsl:when>
	        <xsl:when test="@ТипИндекса='ПоУбыванию'">
			<xsl:text> DESC</xsl:text></xsl:when>
      </xsl:choose>

   </xsl:for-each>

  <xsl:if test="position()!=last()">
	<xsl:text>, </xsl:text>
    </xsl:if>

    <xsl:if test="position()=last()">
	<xsl:text> )</xsl:text>
    </xsl:if>


  </xsl:template>

</xsl:stylesheet>