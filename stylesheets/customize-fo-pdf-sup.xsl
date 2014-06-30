<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:d="http://docbook.org/ns/docbook"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:rx="http://www.renderx.com/XSL/Extensions"
                version='1.0'>
				
	<xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/fo/docbook.xsl"/>
	
	<xsl:import href="customizedtitlepages-fo-pdf-sup.xsl"/>	<!-- http://www.sagehill.net/docbookxsl/TitlePageGraphics.html -->
	
	<xsl:import href="customize-common.xsl"/>

	<xsl:param name="default.table.rules" select="'all'"/> 

	<!-- specify default body font and size -->
	<!-- <xsl:param name="body.font.family" select="'sans-serif,KozMinProVI-Regular'"/> -->		<!-- http://www.simon-cozens.org/content/docbook-fop-fonts-and-multilingua -->
	<xsl:param name="body.font.family" select="'sans-serif'"/>
	<xsl:param name="body.font.master" select="9"/>
	
	<xsl:param name="body.start.indent" select="'0pt'"/>		<!-- Turn off indenting; see http://www.sagehill.net/docbookxsl/PrintOutput.html#IndentingBodyText -->
	<xsl:param name="page.margin.inner">0.75in</xsl:param>
	<xsl:param name="page.margin.outer">0.50in</xsl:param>
	
	<xsl:param name="double.sided" select="'0'"/>
	<xsl:param name="force.blank.pages" select="'1'"/>
	
	<xsl:param name="header.column.widths">1 8 1</xsl:param>

	<xsl:param name="draft.mode" select="'yes'"/>
	<xsl:param name="draft.watermark.image" select="'http://docbook.sourceforge.net/release/xsl-ns/current/images/draft.png'"/>	<!-- uses rewrite rule in catalog.xml to find it -->
	
	<xsl:param name="xref.with.number.and.title" select="'1'"/>
	<xsl:param name="glossentry.show.acronym" select="'yes'"/>
	<xsl:param name="index.on.role" select="'1'"/>			<!-- use old role rather than type terminology in case 4.2 or earlier DTD encountered - see note in DocBook XSL Ch 18 Indexes - Specialized Indexes -->

	<!-- <xsl:param name="insert.xref.page.number" select="'maybe'"/> --> <!-- do not need these since default is to follow xrefstyle in document-->
	<!-- <xsl:param name="insert.link.page.number" select="'maybe'"/> -->
	<!-- <xsl:param name="insert.olink.page.number" select="'maybe'"/> -->
	
	<xsl:param name="ulink.show" select="'0'"/>	<!-- Even though DocBook 5 has no ulink element, this parameter is still used to control URL after link to href ... need to supress this e.g., for LN outlinks in part 16 -->

	<xsl:param name="olink.doctitle" select="'maybe'"/>
	<xsl:param name="insert.olink.pdf.frag" select="'1'"/>

	<xsl:param name="xref.label-title.separator" select="' '"/>		<!-- rather than default ': '; see "http://www.sagehill.net/docbookxsl/CustomXrefs.html" -->

	<!-- footnotes in tables are numbered -->
	<xsl:param name="table.footnote.number.format" select="'1'"/>
	
	<xsl:param name="runinhead.default.title.end.punct" select="''"/>	<!-- do  NOT use default period after formalpara titles -->
	
	<!-- section depth in TOC -->
	<xsl:param name="toc.section.depth" select="7"/>
	<xsl:param name="toc.indent.width">12</xsl:param>	<!-- reduced from initial value of 24, because a lot of long titles cause wrapping -->
	<xsl:param name="formal.title.placement">
	figure after
	</xsl:param>

	<xsl:param name="xep.extensions" select="1"/>
	<!-- <xsl:param name="fop.extensions" select="'1'"/> -->
	<!-- <xsl:param name="fop1.extensions" select="1"/> --> <!--  Enable extensions for FOP version 0.90 and later ; includes bookmarks -->

	<xsl:param name="use.svg" select="1"/>

	<xsl:param name="generate.toc">
	appendix	nop
	article		nop
	book		toc,title,figure,table
	chapter		nop
	part		nop
	preface		nop
	qandadiv	nop
	qandaset	nop
	reference	nop
	section		nop
	set			nop
	</xsl:param>

	<xsl:param name="default.table.width" select="'100%'"/>

	<!-- URLs in PS 3.16 Annex D tables were causing page width overflow, so activate URL "hyphenation"; see "http://www.sagehill.net/docbookxsl/Ulinks.html" -->
	<xsl:param name="ulink.hyphenate.chars">/&amp;?</xsl:param>
	<xsl:param name="ulink.hyphenate">&#x200B;</xsl:param>
	
	<!-- title font size -->
	<xsl:attribute-set name="book.titlepage.recto.style">
		<xsl:attribute name="font-size">14pt</xsl:attribute>
	</xsl:attribute-set>
	<!-- each section starts on a new page -->
	<xsl:attribute-set name="section.title.level1.properties">
		<!-- <xsl:attribute name="break-before">page</xsl:attribute> -->
		<xsl:attribute name="font-size">14pt</xsl:attribute>
	</xsl:attribute-set>
	<!-- 2nd level section font size -->
	<xsl:attribute-set name="section.title.level2.properties">
		<xsl:attribute name="font-size">12pt</xsl:attribute>
	</xsl:attribute-set>
	<!-- admonition style -->
	<xsl:attribute-set name="admonition.title.properties">
		<xsl:attribute name="font-size">9pt</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="informalfigure.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="figure.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
	</xsl:attribute-set>

	<!-- turn off hyphenation in table and variablelist to prevent hyphenation of defined terms and enumerated values ... -->
	<!-- see "http://www.sagehill.net/docbookxsl/PrintCustomEx.html#Hyphenation" and "http://docbook.sourceforge.net/release/xsl/current/doc/fo/variablelist.term.properties.html" -->
	<xsl:attribute-set name="table.table.properties">
		<xsl:attribute name="hyphenate">false</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="variablelist.term.properties">
		<xsl:attribute name="hyphenate">false</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="example.properties">
		<xsl:attribute name="border">0.5pt solid black</xsl:attribute>
		<xsl:attribute name="padding">0.1in</xsl:attribute>
	</xsl:attribute-set>

	<!-- Number pages from 1 - see "https://www.sourceware.org/ml/docbook-apps/2004-q4/msg00148.html"-->
	<!-- This template always returns the string '1', which sets the page number format to 1,2,3,... -->
	<xsl:template name="page.number.format">
		<xsl:param name="element" select="local-name(.)"/>
		<xsl:param name="master-reference" select="''"/>
		<xsl:value-of select="'1'"/>
	</xsl:template>

	<!-- This template always continues the page numbering. -->
	<!-- For double-sided output, it also forces chapters to start on odd-numbered pages -->
	<xsl:template name="initial.page.number">
		<xsl:param name="element" select="local-name(.)"/>
		<xsl:param name="master-reference" select="''"/>
		<xsl:choose>
			<!-- double-sided output -->
			<xsl:when test="$double.sided != 0">auto-odd</xsl:when>
			<xsl:otherwise>auto</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- This parameter should control PDF bookmarks initial state, and is supposed to in FOP, and is used in fop1.xsl; see "http://docbook.sourceforge.net/release/xsl/current/doc/fo/bookmarks.collapse.html" -->
	<xsl:param name="bookmarks.collapse" select="1"></xsl:param>

	<!-- Need to customize xep.xsl template to do the same as fop1.xsl wrt. bookmarks.collapse -->
	<!-- See also (obsolete) discussion at "https://lists.oasis-open.org/archives/docbook-apps/200903/msg00195.html" -->
	<!-- See also "https://lists.oasis-open.org/archives/docbook-apps/201309/msg00071.html" -->
	<!-- See also RenderX User Manual that discusses the "starting-state" attribute and its evolution -->
	<!-- Note that this customization means that the rx namespace needs to be defined in xsl:stylesheet -->
	
<xsl:variable name="bookmarks.state">
  <xsl:choose>
    <xsl:when test="$bookmarks.collapse != 0">hide</xsl:when>
    <xsl:otherwise>show</xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:template match="d:set|d:book|d:part|d:reference|d:preface|d:chapter|d:appendix|d:article
                     |d:glossary|d:bibliography|d:index|d:setindex|d:topic
                     |d:refentry|d:refsynopsisdiv
                     |d:refsect1|d:refsect2|d:refsect3|d:refsection
                     |d:sect1|d:sect2|d:sect3|d:sect4|d:sect5|d:section"
              mode="xep.outline">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="bookmark-label">
    <xsl:apply-templates select="." mode="object.title.markup"/>
  </xsl:variable>


  <!-- Put the root element bookmark at the same level as its children -->
  <!-- If the object is a set or book, generate a bookmark for the toc -->
  <xsl:choose>
    <xsl:when test="self::d:index and $generate.index = 0"/>
    <xsl:when test="parent::*">
      <rx:bookmark internal-destination="{$id}">
	<xsl:attribute name="starting-state">
	  <xsl:value-of select="$bookmarks.state"/>
	</xsl:attribute>
        <rx:bookmark-label>
          <xsl:value-of select="normalize-space($bookmark-label)"/>
        </rx:bookmark-label>
        <xsl:apply-templates select="*" mode="xep.outline"/>
      </rx:bookmark>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="$bookmark-label != ''">
        <rx:bookmark internal-destination="{$id}">
	<xsl:attribute name="starting-state">
	  <xsl:value-of select="$bookmarks.state"/>
	</xsl:attribute>
          <rx:bookmark-label>
            <xsl:value-of select="normalize-space($bookmark-label)"/>
          </rx:bookmark-label>
        </rx:bookmark>
      </xsl:if>

      <xsl:variable name="toc.params">
        <xsl:call-template name="find.path.params">
          <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="contains($toc.params, 'toc')
                    and d:set|d:book|d:part|d:reference|d:section|d:sect1|d:refentry
                        |d:article|d:topic|d:bibliography|d:glossary|d:chapter
                        |d:appendix">
        <rx:bookmark internal-destination="toc...{$id}">
          <rx:bookmark-label>
            <xsl:call-template name="gentext">
              <xsl:with-param name="key" select="'TableofContents'"/>
            </xsl:call-template>
          </rx:bookmark-label>
        </rx:bookmark>
      </xsl:if>
      <xsl:apply-templates select="*" mode="xep.outline"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Want to center table titles (captions) in PDF output; see "https://lists.oasis-open.org/archives/docbook-apps/200403/msg00129.html" -->
<!-- and do not forget to include namespace "d:" when matching ! -->

<xsl:template name="formal.object.heading">
  <xsl:param name="object" select="."/>
  <xsl:param name="placement" select="'before'"/>

  <fo:block xsl:use-attribute-sets="formal.title.properties">
    <xsl:if test="self::d:table">
      <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$placement = 'before'">
        <xsl:attribute
               name="keep-with-next.within-column">always</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute
               name="keep-with-previous.within-column">always</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="$object" mode="object.title.markup">
      <xsl:with-param name="allow-anchors" select="1"/>
    </xsl:apply-templates>
  </fo:block>
</xsl:template>

<!-- customize page header to include part not section; see "http://www.sagehill.net/docbookxsl/PrintHeaders.html"; edit template from "fo/pagesetup.xsl"-->

<xsl:template name="header.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>

  <fo:block>

    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>

	  <!-- rather than using gentext, just assume english -->
      <xsl:when test="$position='left' and $double.sided != 0 and ($sequence = 'even' or $sequence='blank')">
		<xsl:text>Page </xsl:text><fo:page-number/>
      </xsl:when>
	  
      <xsl:when test="$position='right' and $double.sided != 0 and ($sequence = 'odd' or $sequence = 'first')">
		<xsl:text>Page </xsl:text><fo:page-number/>
      </xsl:when>
	  
      <xsl:when test="$position='right' and $double.sided = 0">
		<xsl:text>Page </xsl:text><fo:page-number/>
      </xsl:when>

      <xsl:when test="$position='center' and ($sequence='odd' or $sequence='even' or $sequence='first' or $sequence='blank')">
        <xsl:if test="$pageclass != 'titlepage'">
		  <xsl:value-of select="/d:book/d:subtitle"/>
        </xsl:if>
      </xsl:when>

    </xsl:choose>
  </fo:block>
</xsl:template>

<xsl:template name="footer.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>

  <fo:block>
    <!-- pageclass can be front, body, back -->
    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>
      <xsl:when test="$position='center'">
        <!-- Same for odd, even, empty, and blank sequences -->
		<xsl:choose>
			<!-- rather than calling template name="draft.text", use a simplified version that is sufficient for our purposes -->
			<!-- rather than using gentext and extending common/en.xml (etc.) to include these words, just assume english -->
			<xsl:when test="$draft.mode = 'yes'">
				<xsl:text>- Draft -</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>- Standard -</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
      </xsl:when>

    </xsl:choose>
  </fo:block>
</xsl:template>

<!-- provide access to label attribute of glossdiv and bibliodiv (similar to mechanism in common/labels.xsl) -->

<xsl:template match="d:glossdiv|d:bibliodiv" mode="label.markup">
      <xsl:value-of select="@label"/>
</xsl:template>

<!-- create a glossdiv and bibliodiv specific template to override the default in common/gentext.xsl that does not number these ever -->
<xsl:template match="d:glossdiv|d:bibliodiv"
              mode="object.title.template">

      <xsl:call-template name="gentext.template">
        <xsl:with-param name="context" select="'title-numbered'"/>
        <xsl:with-param name="name">
          <xsl:call-template name="xpath.location"/>
        </xsl:with-param>
      </xsl:call-template>
    
</xsl:template>

<!-- Do not italicize docname in olink -->
<xsl:template match="*" mode="insert.olink.docname.markup">
  <xsl:param name="docname" select="''"/>
  
  <fo:inline>
    <xsl:value-of select="$docname"/>
  </fo:inline>

</xsl:template>

<!-- do not allow cells in tables to break across pages -->
<!-- copied from fo/table.xsl and customized ... see "http://www.sagehill.net/docbookxsl/PrintTableStyles.html#table.table.properties" and "http://www.sagehill.net/docbookxsl/PageBreaking.html" -->
<!-- also limits on this with rowspan - see "http://lists.renderx.com/pipermail/xep-support/2003-January/000966.html" -->

<xsl:template name="table.cell.block.properties">
<xsl:attribute name="keep-together.within-column">always</xsl:attribute>	<!-- DAC. added this -->
  <xsl:choose>
    <xsl:when test="ancestor::d:thead or ancestor::d:tfoot">
      <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:when>
    <!-- Make row headers bold too -->
    <xsl:when test="ancestor::d:tbody and 
                    (ancestor::d:table[@rowheader = 'firstcol'] or
                    ancestor::d:informaltable[@rowheader = 'firstcol']) and
                    ancestor-or-self::d:entry[1][count(preceding-sibling::d:entry) = 0]">
      <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<!-- do not know why we have to include this template copied from fo/titlepage.xsl here, but if we don't the author does not get included in the output -->
<xsl:template match="d:author" mode="titlepage.mode">
<xsl:message>customize-fo-pdf-sup.xsl: d:author titlepage.mode</xsl:message>
  <fo:block>
    <xsl:call-template name="anchor"/>
    <xsl:choose>
      <xsl:when test="d:orgname">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="person.name"/>
        <xsl:if test="d:affiliation/d:orgname">
          <xsl:text>, </xsl:text>
          <xsl:apply-templates select="d:affiliation/d:orgname" mode="titlepage.mode"/>
        </xsl:if>
        <xsl:if test="d:email|d:affiliation/d:address/d:email">
          <xsl:text> </xsl:text>
          <xsl:apply-templates select="(d:email|d:affiliation/d:address/d:email)[1]"/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </fo:block>
</xsl:template>

<!-- DAC. This template from fo/xep.xsl needs to be patched so as not to include both label and title in pdf title metainformation-->

<xsl:template name="xep-document-information">
  <rx:meta-info>
    <xsl:variable name="authors" 
                  select="(//d:author|//d:editor|//d:corpauthor|//d:authorgroup)[1]"/>
    <xsl:if test="$authors">
      <xsl:variable name="author">
        <xsl:choose>
          <xsl:when test="$authors[self::d:authorgroup]">
            <xsl:call-template name="person.name.list">
              <xsl:with-param name="person.list" 
                        select="$authors/*[self::d:author|self::d:corpauthor|
                               self::d:othercredit|self::d:editor]"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$authors[self::d:corpauthor]">
            <xsl:value-of select="$authors"/>
          </xsl:when>
          <xsl:when test="$authors[d:orgname]">
            <xsl:value-of select="$authors/d:orgname"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="person.name">
              <xsl:with-param name="node" select="$authors"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:element name="rx:meta-field">
        <xsl:attribute name="name">author</xsl:attribute>
        <xsl:attribute name="value">
          <xsl:value-of select="normalize-space($author)"/>
        </xsl:attribute>
      </xsl:element>
    </xsl:if>

    <xsl:variable name="title">
      <!--<xsl:apply-templates select="/*[1]" mode="label.markup"/>-->	<!-- DAC. e.g., do not want "PS3.3PS3.3" -->
      <xsl:apply-templates select="/*[1]" mode="title.markup"/>
    </xsl:variable>

    <xsl:element name="rx:meta-field">
      <xsl:attribute name="name">creator</xsl:attribute>
      <xsl:attribute name="value">
        <xsl:text>DocBook </xsl:text>
        <xsl:value-of select="$DistroTitle"/>
        <xsl:text> V</xsl:text>
        <xsl:value-of select="$VERSION"/>
      </xsl:attribute>
    </xsl:element>

    <xsl:element name="rx:meta-field">
      <xsl:attribute name="name">title</xsl:attribute>
      <xsl:attribute name="value">
        <xsl:value-of select="normalize-space($title)"/>
      </xsl:attribute>
    </xsl:element>

    <xsl:if test="//d:keyword">
      <xsl:element name="rx:meta-field">
        <xsl:attribute name="name">keywords</xsl:attribute>
        <xsl:attribute name="value">
          <xsl:for-each select="//d:keyword">
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:if test="position() != last()">
              <xsl:text>, </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:attribute>
      </xsl:element>
    </xsl:if>

    <xsl:if test="//d:subjectterm">
      <xsl:element name="rx:meta-field">
        <xsl:attribute name="name">subject</xsl:attribute>
        <xsl:attribute name="value">
          <xsl:for-each select="//d:subjectterm">
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:if test="position() != last()">
              <xsl:text>, </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:attribute>
      </xsl:element>
    </xsl:if>
  </rx:meta-info>
</xsl:template>

</xsl:stylesheet>
