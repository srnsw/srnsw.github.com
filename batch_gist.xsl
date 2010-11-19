<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA" version="1.0" >
<xsl:output method="text" encoding="UTF-8"/>
<xsl:include href="include/utils.xsl"/>
  <xsl:template match="/">
    <xsl:apply-templates select="//rda:Term"/>
  </xsl:template>
  <xsl:template match="rda:Term">
      <!-- the "%~dp0" creates the new directories in the directory where the batch file sits.
      If running the batch file over a network, using a user's current working directory might be more appropriate.
      To do this, change line to: <xsl:text>mkdir "%cd%\</xsl:text>-->
      <xsl:text>mkdir "%~dp0\</xsl:text>
      <!-- use the "build_address" template in the "utils.xsl" stylesheet bundled with XML Authority Editor.
      This template is used in many AE stylesheets to create breadcrumb-style names i.e. "Function Title - Activity title".
      We use it here to build a directory structure i.e. "Function Title\Activity Title".-->
      <xsl:call-template name="build_address">
        <xsl:with-param name="node" select="."/>
        <xsl:with-param name="sep" select="'\'"/>
      </xsl:call-template>
      <xsl:text>"&#xa;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
