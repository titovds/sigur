<?xml version="1.0" encoding="Windows-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" encoding="Windows-1251"  indent="yes"/>
 

  <xsl:template match="БД">  
    <xsl:copy>
       <xsl:apply-templates/> 
    </xsl:copy>
  </xsl:template>


  <xsl:template match="ТАБЛИЦА">    
    <xsl:text> CREATE TABLE </xsl:text>
    <xsl:value-of select="@НазваниеТаблицы"/><xsl:apply-templates/>
    <xsl:text> (</xsl:text><xsl:apply-templates/>
  </xsl:template>


  <xsl:template match="ПОЛЕ">      
	<xsl:value-of select="@НазваниеПоля"/><xsl:apply-templates/> 

     	<xsl:choose>
       		<xsl:when test="@Тип='ДлинноеЦелоеЧисло'"><xsl:text> integer</xsl:text></xsl:when>
        	<xsl:when test="@Тип='ДатаВремя'"><xsl:text> TIMESTAMP</xsl:text></xsl:when>
   			<xsl:when test="@Тип='Binary'"><xsl:text> Blob(0,2)</xsl:text></xsl:when>
        	<xsl:when test="@Тип='Строка'"><xsl:text> char </xsl:text>(<xsl:value-of select="@Длина"/>)</xsl:when>
   			<xsl:otherwise>ЭКЗЕМПЛЯР</xsl:otherwise>
     	</xsl:choose>   


  		<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>

  		<xsl:if test="@Ключ='Да'">
      		<xsl:text> PRIMARY KEY (</xsl:text>
      		<xsl:value-of select="@НазваниеПоля"/>
      		<xsl:text> ) </xsl:text>
  		<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>   
   	</xsl:if>

  
	<xsl:if test="position()=last()"> <xsl:text> )</xsl:text></xsl:if>  

  </xsl:template>  

</xsl:stylesheet>


