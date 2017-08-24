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
  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="/ntml">
    <xsl:text>\documentclass[a4paper]{article}&#xA;</xsl:text>
    <xsl:text>% This file was created by ntml_to_latex_1.xsl, which is free software licensed under the GNU Affero General Public License 3 or any later version (see https://github.com/publishing-systems/ntml/ and http://www.publishing-systems.org).&#xA;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text>\usepackage[utf8]{inputenc}&#xA;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text>\setlength{\parskip}{0pt}&#xA;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text>\begin{document}&#xA;</xsl:text>
    <xsl:apply-templates select="./title"/>
    <xsl:apply-templates select="./p | ./list"/>
    <xsl:text>\end{document}&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="/ntml/title[1]">
    <xsl:text>\title{</xsl:text>
    <xsl:value-of select="./text()"/>
    <xsl:text>}&#xA;</xsl:text>
    <xsl:text>\date{}&#xA;</xsl:text>
    <xsl:text>\maketitle&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="/ntml/p">
    <xsl:apply-templates/>
    <xsl:text>&#xA;&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="/ntml/p/text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="/ntml/list">
    <xsl:text>\begin{itemize}&#xA;</xsl:text>
    <xsl:text>\setlength{\itemsep}{0pt}&#xA;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>\end{itemize}&#xA;&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="/ntml/list/item">
    <xsl:text>\item </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="/ntml/list/item/text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="/ntml/p/highlighted |
                       /ntml/list/item/highlighted">
    <xsl:text>\emph{</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="/ntml/p/highlighted/text() |
                       /ntml/list/item/highlighted/text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="node()|@*|text()"/>

</xsl:stylesheet>
