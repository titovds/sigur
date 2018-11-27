<?xml version="1.0" encoding="Windows-1251" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="Windows-1251" indent="yes" />


	<xsl:template match="��">
		<xsl:copy>
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>
	

	<xsl:template match="�������">
		<xsl:copy>
        	CREATE TABLE  <xsl:value-of select="@���������������" />
			<xsl:apply-templates />
    		</xsl:copy>
	</xsl:template>

	<xsl:template match="����">
		
		<xsl:text> (</xsl:text>
                <xsl:for-each select="����">
			<xsl:value-of select="@������������" />
			<xsl:apply-templates />
			<xsl:choose>
            	<xsl:when test="@���='���������������������������������'"><xsl:text> uniqueidentifier  </xsl:text> <xsl:value-of select="@�������" /></xsl:when>
            	<xsl:when test="@���='��������'"><xsl:text> varbinary </xsl:text>(<xsl:value-of select="@�����" />) <xsl:value-of select="@�������" /> </xsl:when>
            	<xsl:when test="@���='����������������'"><xsl:text> float  </xsl:text> <xsl:value-of select="@�������" /></xsl:when>
				<xsl:when test="@���='����������������������'"><xsl:text> bigint  </xsl:text> <xsl:value-of select="@�������" /></xsl:when>
                <xsl:when test="@���='�����������������'"><xsl:text> int  </xsl:text> <xsl:value-of select="@�������" /></xsl:when>
				<xsl:when test="@���='���������'"><xsl:text> datetime </xsl:text> <xsl:value-of select="@�������" /></xsl:when>
				<xsl:when test="@���='Binary'"><xsl:text> image </xsl:text> <xsl:value-of select="@�������" /></xsl:when>
				<xsl:when test="@���='������'"><xsl:text> varchar </xsl:text>(<xsl:value-of select="@�����" />) <xsl:value-of select="@�������" /> </xsl:when>
				<xsl:otherwise>���������</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
                </xsl:for-each>

		
		<xsl:if test="count(����[@����='��'])!=0">
		<xsl:text>, PRIMARY KEY (</xsl:text>
                        <xsl:for-each select="����[@����='��']">
				<xsl:value-of select="@������������" />
				<xsl:if test="position()!=last()"> <xsl:text>, </xsl:text> </xsl:if>
                        </xsl:for-each>
		<xsl:text> ) </xsl:text>
		</xsl:if>

		<xsl:text> ) </xsl:text>
	</xsl:template>

</xsl:stylesheet>
