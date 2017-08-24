<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (C) 2014-2017  Stephan Kreutzer

This file is an extension for the
digital_publishing_workflow_tools package.

This file is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License version 3 or any later version,
as published by the Free Software Foundation.

This file is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License 3 for more details.

You should have received a copy of the GNU Affero General Public License 3
along with part of this file. If not, see <http://www.gnu.org/licenses/>.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>

  <xsl:template match="/ntml">
    <html version="-//W3C//DTD XHTML 1.1//EN" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/MarkUp/SCHEMA/xhtml11.xsd" xml:lang="en" lang="en">
      <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <xsl:comment> This file was created by ntml_to_latex_1.xsl, which is free software licensed under the GNU Affero General Public License 3 or any later version (see https://github.com/publishing-systems/ntml/ and http://www.publishing-systems.org). </xsl:comment><xsl:text>&#xA;</xsl:text>
        <title>
          <xsl:value-of select="./title[1]/text()"/>
        </title>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="/ntml/p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="/ntml/p/text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="/ntml/list">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="/ntml/list/item">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="/ntml/list/item/text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="/ntml/p/highlighted |
                       /ntml/list/item/highlighted">
    <i>
      <xsl:apply-templates/>
    </i>
  </xsl:template>

  <xsl:template match="/ntml/p/highlighted/text() |
                       /ntml/list/item/highlighted/text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="node()|@*|text()"/>

</xsl:stylesheet>
