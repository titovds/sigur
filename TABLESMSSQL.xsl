<?xml version="1.0" encoding="Windows-1251" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="Windows-1251" indent="yes" />


	<xsl:template match="БД">
		<xsl:copy>
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>
	

	<xsl:template match="ТАБЛИЦА">
		<xsl:copy>
        	CREATE TABLE  <xsl:value-of select="@НазваниеТаблицы" />
			<xsl:apply-templates />
    		</xsl:copy>
	</xsl:template>

	<xsl:template match="ПОЛЯ">
		
		<xsl:text> (</xsl:text>
                <xsl:for-each select="ПОЛЕ">
			<xsl:value-of select="@НазваниеПоля" />
			<xsl:apply-templates />
			<xsl:choose>
            	<xsl:when test="@Тип='ГлобальныйУникальныйИдентификатор'"><xsl:text> uniqueidentifier  </xsl:text> <xsl:value-of select="@Нулевой" /></xsl:when>
            	<xsl:when test="@Тип='Бинарный'"><xsl:text> varbinary </xsl:text>(<xsl:value-of select="@Длина" />) <xsl:value-of select="@Нулевой" /> </xsl:when>
            	<xsl:when test="@Тип='СПлавающейТочкой'"><xsl:text> float  </xsl:text> <xsl:value-of select="@Нулевой" /></xsl:when>
				<xsl:when test="@Тип='ОченьДлинноеЦелоеЧисло'"><xsl:text> bigint  </xsl:text> <xsl:value-of select="@Нулевой" /></xsl:when>
                <xsl:when test="@Тип='ДлинноеЦелоеЧисло'"><xsl:text> int  </xsl:text> <xsl:value-of select="@Нулевой" /></xsl:when>
				<xsl:when test="@Тип='ДатаВремя'"><xsl:text> datetime </xsl:text> <xsl:value-of select="@Нулевой" /></xsl:when>
				<xsl:when test="@Тип='Binary'"><xsl:text> image </xsl:text> <xsl:value-of select="@Нулевой" /></xsl:when>
				<xsl:when test="@Тип='Строка'"><xsl:text> varchar </xsl:text>(<xsl:value-of select="@Длина" />) <xsl:value-of select="@Нулевой" /> </xsl:when>
				<xsl:otherwise>ЭКЗЕМПЛЯР</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
                </xsl:for-each>

		
		<xsl:if test="count(ПОЛЕ[@Ключ='Да'])!=0">
		<xsl:text>, PRIMARY KEY (</xsl:text>
                        <xsl:for-each select="ПОЛЕ[@Ключ='Да']">
				<xsl:value-of select="@НазваниеПоля" />
				<xsl:if test="position()!=last()"> <xsl:text>, </xsl:text> </xsl:if>
                        </xsl:for-each>
		<xsl:text> ) </xsl:text>
		</xsl:if>

		<xsl:text> ) </xsl:text>
	</xsl:template>

</xsl:stylesheet>
