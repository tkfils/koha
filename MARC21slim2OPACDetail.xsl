<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: MARC21slim2DC.xsl,v 1.1 2003/01/06 08:20:27 adam Exp $ -->
<!DOCTYPE stylesheet [<!ENTITY nbsp "&#160;" >]>
<xsl:stylesheet version="1.0"
  xmlns:marc="http://www.loc.gov/MARC21/slim"
  xmlns:items="http://www.koha-community.org/items"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="marc items">
    <xsl:import href="http://kingsfundlibrary.co.uk/css/MARC21slimUtils.xsl"/>
    <xsl:output method = "xml" indent="yes" omit-xml-declaration = "yes" />
    <xsl:template match="/">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="marc:record">
<xsl:variable name="bubbles">
<xsl:value-of select="items:nonpublicnote"/>
</xsl:variable>
<xsl:variable name="coyi">
<xsl:value-of select="marc:datafield[@tag=952]/marc:subfield[@code='x']" />
</xsl:variable>
<xsl:variable name="jbr">
<xsl:value-of select="marc:datafield[@tag=999]/marc:subfield[@code='c']" />
</xsl:variable>
<xsl:variable name="sturgeon">
<xsl:value-of select="format-number($jbr,'000000')" />
</xsl:variable>
        <!-- Option: Display Alternate Graphic Representation (MARC 880)  -->
        <xsl:variable name="display880" select="boolean(marc:datafield[@tag=880])"/>
    <xsl:variable name="UseControlNumber" select="1"/>
    <xsl:variable name="DisplayOPACiconsXSLT" select="marc:sysprefs/marc:syspref[@name='DisplayOPACiconsXSLT']"/>
    <xsl:variable name="OPACURLOpenInNewWindow" select="marc:sysprefs/marc:syspref[@name='OPACURLOpenInNewWindow']"/>
    <xsl:variable name="URLLinkText" select="marc:sysprefs/marc:syspref[@name='URLLinkText']"/>
        <xsl:variable name="leader" select="marc:leader"/>
        <xsl:variable name="leader6" select="substring($leader,7,1)"/>
        <xsl:variable name="leader7" select="substring($leader,8,1)"/>
        <xsl:variable name="leader19" select="substring($leader,20,1)"/>
        <xsl:variable name="controlField008" select="marc:controlfield[@tag=008]"/>
        <xsl:variable name="materialTypeCode">
            <xsl:choose>
                <xsl:when test="$leader19='a'">ST</xsl:when>
                <xsl:when test="$leader6='a'">
                    <xsl:choose>
                        <xsl:when test="$leader7='a' or $leader7='c' or $leader7='d' or $leader7='m'">BK</xsl:when>
                        <xsl:when test="$leader7='b' or $leader7='i' or $leader7='s'">SE</xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$leader6='t'">BK</xsl:when>
                <xsl:when test="$leader6='o' or $leader6='p'">MX</xsl:when>
                <xsl:when test="$leader6='m'">CF</xsl:when>
                <xsl:when test="$leader6='e' or $leader6='f'">MP</xsl:when>
                <xsl:when test="$leader6='g' or $leader6='k' or $leader6='o' or $leader6='r'">VM</xsl:when>
                <xsl:when test="$leader6='c' or $leader6='d' or $leader6='i' or $leader6='j'">MU</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="materialTypeLabel">
            <xsl:choose>
                <xsl:when test="$leader19='a'">Set</xsl:when>
                <xsl:when test="$leader6='a'">
                    <xsl:choose>
                        <xsl:when test="$leader7='a' or $leader7='c' or $leader7='d' or $leader7='m'">Book</xsl:when>
                        <xsl:when test="$leader7='b' or $leader7='i' or $leader7='s'">
                            <xsl:choose>
                                <xsl:when test="substring($controlField008,22,1)!='m'">Continuing Resource</xsl:when>
                                <xsl:otherwise>Series</xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$leader6='t'">Book</xsl:when>
				<xsl:when test="$leader6='o'">Kit</xsl:when>
                <xsl:when test="$leader6='p'">Mixed Materials</xsl:when>
                <xsl:when test="$leader6='m'">Computer File</xsl:when>
                <xsl:when test="$leader6='e' or $leader6='f'">Map</xsl:when>
                <xsl:when test="$leader6='g' or $leader6='k' or $leader6='o' or $leader6='r'">Visual Material</xsl:when>
                <xsl:when test="$leader6='c' or $leader6='d' or $leader6='i' or $leader6='j'">Sound</xsl:when>
            </xsl:choose>
        </xsl:variable>

        <!-- Title Statement -->
        <!-- Alternate Graphic Representation (MARC 880) -->
        <xsl:if test="$display880">
            <h1 class="title">
                <xsl:call-template name="m880Select">
                    <xsl:with-param name="basetags">245</xsl:with-param>
                    <xsl:with-param name="codes">abhfgknps</xsl:with-param>
                </xsl:call-template>
            </h1>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=245]">
        <h1>
            <xsl:for-each select="marc:datafield[@tag=245]">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">a</xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="marc:subfield[@code='b']">
                        <xsl:text> </xsl:text>
                        <xsl:call-template name="subfieldSelect">
                            <xsl:with-param name="codes">b</xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="marc:subfield[@code='h']">
                        <xsl:text> </xsl:text>
                        <xsl:call-template name="subfieldSelect">
                            <xsl:with-param name="codes">h</xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">fgknps</xsl:with-param>
                    </xsl:call-template>
            </xsl:for-each>
        </h1>
        </xsl:if>

        <!-- Author Statement: Alternate Graphic Representation (MARC 880) -->
        <xsl:if test="$display880">
            <h5 class="author">
                <xsl:call-template name="m880Select">
                    <xsl:with-param name="basetags">100,110,111,700,710,711</xsl:with-param>
                    <xsl:with-param name="codes">abc</xsl:with-param>
                    <xsl:with-param name="index">au</xsl:with-param>
                    <!-- do not use label 'by ' here, it would be repeated for every occurence of 100,110,111,700,710,711 -->
                </xsl:call-template>
            </h5>
        </xsl:if>

        <xsl:choose>
        <xsl:when test="marc:datafield[@tag=100] or marc:datafield[@tag=110] or marc:datafield[@tag=111] or marc:datafield[@tag=700] or marc:datafield[@tag=710] or marc:datafield[@tag=711]">
        <h5 class="author">by
        <xsl:for-each select="marc:datafield[@tag=100 or @tag=700]">
        <a>
        <xsl:choose>
            <xsl:when test="marc:subfield[@code=9]">
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=an:<xsl:value-of select="marc:subfield[@code=9]"/></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
            <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=au:<xsl:value-of select="marc:subfield[@code='a']"/></xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="nameABCDQ"/></a>
        <xsl:choose>
        <xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>

        <xsl:for-each select="marc:datafield[@tag=110 or @tag=710]">
        <a>
        <xsl:choose>
            <xsl:when test="marc:subfield[@code=9]">
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=an:<xsl:value-of select="marc:subfield[@code=9]"/></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
            <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=au:<xsl:value-of select="marc:subfield[@code='a']"/></xsl:attribute>      
            </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="nameABCDN"/></a>
        <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>

        <xsl:for-each select="marc:datafield[@tag=111 or @tag=711]">
        <a>
        <xsl:choose>
            <xsl:when test="marc:subfield[@code=9]">
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=an:<xsl:value-of select="marc:subfield[@code=9]"/></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
            <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=au:<xsl:value-of select="marc:subfield[@code='a']"/></xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
       <xsl:call-template name="nameACDEQ"/></a>
        <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>

        </xsl:for-each>
        </h5>
        </xsl:when>
        </xsl:choose>
        <div id="views">
        <span class="view"><span id="Normalview">Normal View</span> </span>
        <span class="view"><a id="MARCviewPop" href="/cgi-bin/koha/opac-showmarc.pl?id={marc:datafield[@tag=999]/marc:subfield[@code='c']}" title="MARC" rel="gb_page_center[600,500]">MARC View</a></span>
        <span class="view"><a id="MARCview" href="/cgi-bin/koha/opac-MARCdetail.pl?biblionumber={marc:datafield[@tag=999]/marc:subfield[@code='c']}" title="MARC">Expanded MARC View</a></span>
        <span class="view"><a id="ISBDview" href="/cgi-bin/koha/opac-ISBDdetail.pl?biblionumber={marc:datafield[@tag=999]/marc:subfield[@code='c']}">Card View (ISBD)</a></span>
        </div>

   <xsl:if test="$DisplayOPACiconsXSLT!='0'">
        <xsl:if test="$materialTypeCode!=''">
        <span class="results_summary"><span class="label">Type: </span>
        <xsl:element name="img"><xsl:attribute name="src">/opac-tmpl/prog/famfamfam/<xsl:value-of select="$materialTypeCode"/>.png</xsl:attribute><xsl:attribute name="alt"></xsl:attribute></xsl:element>
        <xsl:value-of select="$materialTypeLabel"/>
        </span>
        </xsl:if>
   </xsl:if>

        <!--Series: Alternate Graphic Representation (MARC 880) -->
        <xsl:if test="$display880">
            <xsl:call-template name="m880Select">
                <xsl:with-param name="basetags">440,490</xsl:with-param>
                <xsl:with-param name="codes">av</xsl:with-param>
                <xsl:with-param name="class">results_summary</xsl:with-param>
                <xsl:with-param name="label">Series: </xsl:with-param>
                <xsl:with-param name="index">se</xsl:with-param>
            </xsl:call-template>
        </xsl:if>

        <!-- Series -->
        <xsl:if test="marc:datafield[@tag=440 or @tag=490]">
        <span class="results_summary"><span class="label">Series: </span>
        <!-- 440 -->
        <xsl:for-each select="marc:datafield[@tag=440]">
             <a href="/cgi-bin/koha/opac-search.pl?q=se:{marc:subfield[@code='a']}">
            <xsl:call-template name="chopPunctuation">
                            <xsl:with-param name="chopString">
                                <xsl:call-template name="subfieldSelect">
                                    <xsl:with-param name="codes">av</xsl:with-param>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
			</a>
                    <xsl:text> </xsl:text><xsl:call-template name="part"/>
            <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>

        <!-- 490 Series not traced, Ind1 = 0 -->
        <xsl:for-each select="marc:datafield[@tag=490]">
             <a href="/cgi-bin/koha/opac-search.pl?q=se:{marc:subfield[@code='a']}">
                        <xsl:call-template name="chopPunctuation">
                            <xsl:with-param name="chopString">
                                <xsl:call-template name="subfieldSelect">
                                    <xsl:with-param name="codes">av</xsl:with-param>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
            </a>
                    <xsl:call-template name="part"/>
        <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        <!-- 490 Series traced, Ind1 = 1 -->
        <xsl:if test="marc:datafield[@tag=490][@ind1=1]">
            <xsl:for-each select="marc:datafield[@tag=800 or @tag=810 or @tag=811 or @tag=830]">
                <xsl:choose>
                    <xsl:when test="marc:subfield[@code='w']">
                        <a href="/cgi-bin/koha/opac-search.pl?q=rcn:{marc:subfield[@code='w']}">
                            <xsl:call-template name="chopPunctuation">
                                <xsl:with-param name="chopString">
                                    <xsl:call-template name="subfieldSelect">
                                        <xsl:with-param name="codes">at</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:with-param>
                            </xsl:call-template>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="/cgi-bin/koha/opac-search.pl?q=se:{marc:subfield[@code='t']}">
                            <xsl:call-template name="chopPunctuation">
                                <xsl:with-param name="chopString">
                                    <xsl:call-template name="subfieldSelect">
                                        <xsl:with-param name="codes">at</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:with-param>
                            </xsl:call-template>
                        </a>
                        <xsl:call-template name="part"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>: </xsl:text>
                <xsl:value-of  select="marc:subfield[@code='v']" />
            <xsl:choose><xsl:when test="position()=last()"><xsl:text></xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </xsl:if>
        </span>
        </xsl:if>

        <!-- Volumes of sets and traced series -->
        <xsl:if test="$materialTypeCode='ST' or substring($controlField008,22,1)='m'">
        <span class="results_summary"><span class="label">Volumes: </span>
            <a>
            <xsl:choose>
            <xsl:when test="$UseControlNumber = '1' and marc:controlfield[@tag=001]">
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=rcn:<xsl:value-of select="marc:controlfield[@tag=001]"/></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=Title:<xsl:value-of select="translate(marc:datafield[@tag=245]/marc:subfield[@code='a'], '/', '')"/></xsl:attribute>
            </xsl:otherwise>
            </xsl:choose>
            <xsl:text>Show volumes</xsl:text>
            </a>
        </span>
        </xsl:if>

        <!-- Set -->
        <xsl:if test="$leader19='c'">
        <span class="results_summary"><span class="label">Set: </span>
        <xsl:for-each select="marc:datafield[@tag=773]">
            <a>
            <xsl:choose>
            <xsl:when test="$UseControlNumber = '1' and marc:subfield[@code='w']">
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=Control-number:<xsl:value-of select="marc:subfield[@code='w']"/></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=Title:<xsl:value-of select="translate(//marc:datafield[@tag=245]/marc:subfield[@code='a'], '.', '')"/></xsl:attribute>
            </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="translate(//marc:datafield[@tag=245]/marc:subfield[@code='a'], '.', '')" />
            </a>
            <xsl:choose>
                <xsl:when test="position()=last()"></xsl:when>
                <xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>

        <!-- Publisher Statement: Alternate Graphic Representation (MARC 880) -->
        <xsl:if test="$display880">
            <xsl:call-template name="m880Select">
                <xsl:with-param name="basetags">260</xsl:with-param>
                <xsl:with-param name="codes">abcg</xsl:with-param>
                <xsl:with-param name="class">results_summary</xsl:with-param>
                <xsl:with-param name="label">Publisher: </xsl:with-param>
            </xsl:call-template>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=260]">
        <span class="results_summary"><span class="label">Publisher: </span>
            <xsl:for-each select="marc:datafield[@tag=260]">
                <xsl:if test="marc:subfield[@code='b']">
                <a href="/cgi-bin/koha/opac-search.pl?q=pb:{marc:subfield[@code='b']}">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">b</xsl:with-param>
                    </xsl:call-template>
               </a>
               </xsl:if>
               <xsl:text> </xsl:text>
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">acg</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span> 
        </xsl:if>

        <!-- Edition Statement: Alternate Graphic Representation (MARC 880) -->
        <xsl:if test="$display880">
            <xsl:call-template name="m880Select">
                <xsl:with-param name="basetags">250</xsl:with-param>
                <xsl:with-param name="codes">ab</xsl:with-param>
                <xsl:with-param name="class">results_summary</xsl:with-param>
                <xsl:with-param name="label">Edition: </xsl:with-param>
            </xsl:call-template>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=250]">
        <span class="results_summary"><span class="label">Edition: </span>
            <xsl:for-each select="marc:datafield[@tag=250]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">ab</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
        </xsl:if>

        <!-- Description: Alternate Graphic Representation (MARC 880) -->
        <xsl:if test="$display880">
            <xsl:call-template name="m880Select">
                <xsl:with-param name="basetags">300</xsl:with-param>
                <xsl:with-param name="codes">abceg</xsl:with-param>
                <xsl:with-param name="class">results_summary</xsl:with-param>
                <xsl:with-param name="label">Description: </xsl:with-param>
            </xsl:call-template>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=300]">
        <span class="results_summary"><span class="label">Description: </span>
            <xsl:for-each select="marc:datafield[@tag=300]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">abceg</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
       </xsl:if>

       <abbr class="unapi-id" title="koha:biblionumber:{marc:datafield[@tag=999]/marc:subfield[@code='c']}" ><!-- unAPI --></abbr>

<!-- Adding 306 field Playing Time display -->
	<xsl:if test="marc:datafield[@tag=306]">
        <span class="results_summary"><span class="label">Playing time: </span>
        <xsl:for-each select="marc:datafield[@tag=306]">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>
<!-- End of added 306 section -->

<!-- Adding 511 field Participants -->
	<xsl:if test="marc:datafield[@tag=511]">
        <span class="results_summary"><span class="label">Participants: </span>
        <xsl:for-each select="marc:datafield[@tag=511]">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>
<!-- End of added 511 section -->

<!-- Adding 518 field Date and Place display -->
	<xsl:if test="marc:datafield[@tag=518]">
        <span class="results_summary"><span class="label">Date and Place: </span>
        <xsl:for-each select="marc:datafield[@tag=518]">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>
<!-- End of added 518 section -->

	<xsl:if test="marc:datafield[@tag=020]">
        <span class="results_summary"><span class="label">ISBN: </span>
        <xsl:for-each select="marc:datafield[@tag=020]">
        <xsl:variable name="isbn" select="marc:subfield[@code='a']"/>
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=022]">
        <span class="results_summary"><span class="label">ISSN: </span>
        <xsl:for-each select="marc:datafield[@tag=022]">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=050]">
        <span class="results_summary"><span class="label">Class Number: </span>
        <xsl:for-each select="marc:datafield[@tag=050]">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>


        <xsl:if test="marc:datafield[@tag=310]">
        <span class="results_summary"><span class="label">Current Publication Frequency: </span>
        <xsl:for-each select="marc:datafield[@tag=310]">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=362]">
        <span class="results_summary"><span class="label">Dates of Publication: </span>
        <xsl:for-each select="marc:datafield[@tag=362]">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=500]">
        <span class="results_summary"><span class="label">General Note: </span>
        <xsl:for-each select="marc:datafield[@tag=500]">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=520]">
        <span class="results_summary"><span class="label">Summary: </span>
        <xsl:for-each select="marc:datafield[@tag=520]">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=773]/marc:subfield[@code='t']">
        <span class="results_summary"><span class="label">Journal Title: </span>
            <xsl:for-each select="marc:datafield[@tag=773]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">t</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
       </xsl:if>

        <xsl:if test="marc:datafield[@tag=773]/marc:subfield[@code='y']">
        <span class="results_summary"><span class="label">Year: </span>
            <xsl:for-each select="marc:datafield[@tag=773]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">y</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
       </xsl:if>

        <xsl:if test="marc:datafield[@tag=773]/marc:subfield[@code='v']">
        <span class="results_summary"><span class="label">Volume: </span>
            <xsl:for-each select="marc:datafield[@tag=773]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">v</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
       </xsl:if>

        <xsl:if test="marc:datafield[@tag=773]/marc:subfield[@code='n']">
        <span class="results_summary"><span class="label">Number: </span>
            <xsl:for-each select="marc:datafield[@tag=773]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">n</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
       </xsl:if>

        <xsl:if test="marc:datafield[@tag=773]/marc:subfield[@code='p']">
        <span class="results_summary"><span class="label">Pagination: </span>
            <xsl:for-each select="marc:datafield[@tag=773]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">p</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
       </xsl:if>

        <xsl:if test="marc:datafield[@tag=773]/marc:subfield[@code='d']">
        <span class="results_summary"><span class="label">Date: </span>
            <xsl:for-each select="marc:datafield[@tag=773]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">d</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
       </xsl:if>

        <xsl:if test="marc:datafield[@tag=773]/marc:subfield[@code='s']">
        <span class="results_summary"><span class="label">Supplement Information: </span>
            <xsl:for-each select="marc:datafield[@tag=773]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">s</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>

       </xsl:if>
        <xsl:if test="marc:datafield[@tag=773]/marc:subfield[@code='u']">
        <span class="results_summary"><span class="label">URL: </span>
            <xsl:for-each select="marc:datafield[@tag=773]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">u</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
       </xsl:if>



        <!-- Other Title  Statement: Alternate Graphic Representation (MARC 880) -->
        <xsl:if test="$display880">
            <xsl:call-template name="m880Select">
                <xsl:with-param name="basetags">246</xsl:with-param>
                <xsl:with-param name="codes">abhfgnp</xsl:with-param>
                <xsl:with-param name="class">results_summary</xsl:with-param>
                <xsl:with-param name="label">Other Title: </xsl:with-param>
            </xsl:call-template>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=246]">
        <span class="results_summary"><span class="label">Other Title: </span>
            <xsl:for-each select="marc:datafield[@tag=246]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">iabhfgnp</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
       </xsl:if>

        <xsl:if test="marc:datafield[@tag=248]">
        <span class="results_summary"><span class="label">Volume Title: </span>
            <xsl:for-each select="marc:datafield[@tag=248]">
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">iabhfgnp</xsl:with-param>
                    </xsl:call-template>
                   </xsl:with-param>
               </xsl:call-template>
                    <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
            </xsl:for-each>
        </span>
       </xsl:if>

        <!-- Uniform Title  Statement: Alternate Graphic Representation (MARC 880) -->
        <xsl:if test="$display880">
            <xsl:call-template name="m880Select">
                <xsl:with-param name="basetags">130,240</xsl:with-param>
                <xsl:with-param name="codes">adfklmor</xsl:with-param>
                <xsl:with-param name="class">results_summary</xsl:with-param>
                <xsl:with-param name="label">Uniform Title: </xsl:with-param>
            </xsl:call-template>
        </xsl:if>

        <xsl:if test="marc:datafield[@tag=130]|marc:datafield[@tag=240]|marc:datafield[@tag=730][@ind2!=2]">
        <span class="results_summary"><span class="label">Uniform titles: </span>
        <xsl:for-each select="marc:datafield[@tag=130]|marc:datafield[@tag=240]|marc:datafield[@tag=730][@ind2!=2]">
            <xsl:variable name="str">
                <xsl:for-each select="marc:subfield">
                    <xsl:if test="(contains('adfklmor',@code) and (not(../marc:subfield[@code='n' or @code='p']) or (following-sibling::marc:subfield[@code='n' or @code='p'])))">
                        <xsl:value-of select="text()"/>
                        <xsl:text> </xsl:text>
                     </xsl:if>
                </xsl:for-each>
            </xsl:variable>
            <xsl:call-template name="chopPunctuation">
                <xsl:with-param name="chopString">
                    <xsl:value-of select="substring($str,1,string-length($str)-1)"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>

        <xsl:if test="marc:datafield[substring(@tag, 1, 1) = '6']">
            <span class="results_summary"><span class="label">Subject(s): </span>
            <xsl:for-each select="marc:datafield[substring(@tag, 1, 1) = '6']">
            <a>
             <xsl:choose> 
             <xsl:when test="marc:subfield[@code=9]">
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=an:<xsl:value-of select="marc:subfield[@code=9]"/></xsl:attribute> 
             </xsl:when> 
             <xsl:otherwise> 
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=su:<xsl:value-of select="marc:subfield[@code='a']"/></xsl:attribute>
             </xsl:otherwise>
             </xsl:choose> 
            <xsl:call-template name="chopPunctuation">
                <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">abcdvxyz</xsl:with-param>
                        <xsl:with-param name="subdivCodes">vxyz</xsl:with-param>
                        <xsl:with-param name="subdivDelimiter">-- </xsl:with-param>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:call-template>
            </a>
            <xsl:choose>
            <xsl:when test="position()=last()"></xsl:when>
            <xsl:otherwise> | </xsl:otherwise>
            </xsl:choose>

            </xsl:for-each>
            </span>
        </xsl:if>

 <!--    <xsl:if test="$coyi='Archive' or $bubbles='Archive'">   -->
<a href="http://archive.kingsfund.org.uk/{$jbr}/"><img id="imageArchiveLink" onerror="this.style.display='none'" height="120" width="90" title="Digital copy" src="http://iip7.da.ulcc.ac.uk/thumb/kingsf/{$sturgeon}/01/0001.tif" onClick="_gaq.push(['_trackEvent','Link to archive','Thumbnail click','http://archive.kingsfund.org.uk/{$jbr}/']);" /></a><br />
<a id="textArchiveLink" href="http://archive.kingsfund.org.uk/{$jbr}/" onClick="_gaq.push(['_trackEvent','Link to archive'.'Text click','http://archive.kingsfund.org.uk/{$jbr}/']);">Digital copy</a>
 <!--     </xsl:if>     -->
        <xsl:if test="marc:datafield[@tag=856]">
<xsl:if test="$coyi!='Archive'">
        <span class="results_summary"><span class="label">Availability: </span>
        <xsl:for-each select="marc:datafield[@tag=856]">
            <a><xsl:attribute name="href"><xsl:value-of select="marc:subfield[@code='u']"/></xsl:attribute>
            <xsl:if test="$OPACURLOpenInNewWindow='1'">
                <xsl:attribute name="target">_blank</xsl:attribute>
            </xsl:if>
            <xsl:choose>
            <xsl:when test="marc:subfield[@code='y' or @code='3' or @code='z']">
                <xsl:call-template name="subfieldSelect">
                    <xsl:with-param name="codes">y3z</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="not(marc:subfield[@code='y']) and not(marc:subfield[@code='3']) and not(marc:subfield[@code='z'])">
                <xsl:choose>
                <xsl:when test="$URLLinkText!=''">
                    <xsl:value-of select="$URLLinkText"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Online access</xsl:text>
                </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            </xsl:choose>
            </a>
            <xsl:choose>
            <xsl:when test="position()=last()"><xsl:text>  </xsl:text></xsl:when>
            <xsl:otherwise> | </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>
        </xsl:if>

        <!-- 505 -->
        <xsl:if test="marc:datafield[@tag=505]">
        <xsl:for-each select="marc:datafield[@tag=505]">
        <span class="results_summary contents"><span class="label">
        <xsl:choose>
        <xsl:when test="@ind1=0">
            Contents:
        </xsl:when>
        <xsl:when test="@ind1=1">
            Incomplete contents:
        </xsl:when>
        <xsl:when test="@ind1=1">
            Partial contents:
        </xsl:when>
        </xsl:choose>
        </span>
        <xsl:choose>
        <xsl:when test="@ind2=0">
            <xsl:call-template name="subfieldSelect">
                <xsl:with-param name="codes">tru</xsl:with-param>
            </xsl:call-template>
        <a href="{marc:subfield[@code='u']}">Link</a>
        </xsl:when>
        <xsl:otherwise>
            <xsl:call-template name="subfieldSelect">
                <xsl:with-param name="codes">arg</xsl:with-param>
            </xsl:call-template>
        <a href="{marc:subfield[@code='u']}">Link</a>
        </xsl:otherwise>
        </xsl:choose>
        </span>
        </xsl:for-each>
        </xsl:if>

        <!--  775 Other Edition  -->
        <xsl:if test="marc:datafield[@tag=775]">
        <span class="results_summary"><span class="label">Other Editions: </span>
        <xsl:for-each select="marc:datafield[@tag=775]">
            <xsl:if test="marc:subfield[@code='i']">
                <xsl:call-template name="subfieldSelect">
                    <xsl:with-param name="codes">i</xsl:with-param>
                </xsl:call-template>
                <xsl:text>: </xsl:text>
            </xsl:if>
            <a>
            <xsl:choose>
            <xsl:when test="$UseControlNumber = '1' and marc:subfield[@code='w']">
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=Control-number:<xsl:value-of select="marc:subfield[@code='w']"/></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=Title:<xsl:value-of select="translate(marc:subfield[@code='t'], '.', '')"/></xsl:attribute>
            </xsl:otherwise>
            </xsl:choose>
            <xsl:call-template name="subfieldSelect">
                <xsl:with-param name="codes">t</xsl:with-param>
            </xsl:call-template>
            </a>
            <xsl:choose>
                <xsl:when test="position()=last()"></xsl:when>
                <xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        </span>
        </xsl:if>

        <!-- 780 -->
        <xsl:if test="marc:datafield[@tag=780]">
        <xsl:for-each select="marc:datafield[@tag=780]">
        <span class="results_summary"><span class="label">
        <xsl:choose>
        <xsl:when test="@ind2=0">
            Continues:
        </xsl:when>
        <xsl:when test="@ind2=1">
            Continues in part:
        </xsl:when>
        <xsl:when test="@ind2=2">
            Supersedes:
        </xsl:when>
        <xsl:when test="@ind2=3">
            Supersedes in part:
        </xsl:when>
        <xsl:when test="@ind2=4">
            Formed by the union: ... and: ...
        </xsl:when>
        <xsl:when test="@ind2=5">
            Absorbed:
        </xsl:when>
        <xsl:when test="@ind2=6">
            Absorbed in part:
        </xsl:when>
        <xsl:when test="@ind2=7">
            Separated from:
        </xsl:when>
        </xsl:choose>
        </span>
                <xsl:variable name="f780">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">at</xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
            <xsl:choose>
                <xsl:when test="$UseControlNumber = '1' and marc:subfield[@code='w']">
                    <a href="/cgi-bin/koha/opac-search.pl?q=Control-number:{marc:subfield[@code='w']}">
                        <xsl:value-of select="translate($f780, '()', '')"/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <a><xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=<xsl:value-of select="translate($f780, '()', '')"/></xsl:attribute>
                        <xsl:value-of select="translate($f780, '()', '')"/>
                    </a>
                </xsl:otherwise>
            </xsl:choose>
        </span>
 
        <xsl:choose>
        <xsl:when test="@ind1=0">
            <span class="results_summary"><xsl:value-of select="marc:subfield[@code='n']"/></span>
        </xsl:when>
        </xsl:choose>

        </xsl:for-each>
        </xsl:if>

        <!-- 785 -->
        <xsl:if test="marc:datafield[@tag=785]">
        <xsl:for-each select="marc:datafield[@tag=785]">
        <span class="results_summary"><span class="label">
        <xsl:choose>
        <xsl:when test="@ind2=0">
            Continued by:
        </xsl:when>
        <xsl:when test="@ind2=1">
            Continued in part by:
        </xsl:when>
        <xsl:when test="@ind2=2">
            Superseded by:
        </xsl:when>
        <xsl:when test="@ind2=3">
            Superseded in part by:
        </xsl:when>
        <xsl:when test="@ind2=4">
            Absorbed by:
        </xsl:when>
        <xsl:when test="@ind2=5">
            Absorbed in part by:
        </xsl:when>
        <xsl:when test="@ind2=6">
            Split into .. and ...:
        </xsl:when>
        <xsl:when test="@ind2=7">
            Merged with ... to form ...
        </xsl:when>
        <xsl:when test="@ind2=8">
            Changed back to:
        </xsl:when>

        </xsl:choose>
        </span>
                   <xsl:variable name="f785">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">at</xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>

            <xsl:choose>
                <xsl:when test="$UseControlNumber = '1' and marc:subfield[@code='w']">
                    <a href="/cgi-bin/koha/opac-search.pl?q=Control-number:{marc:subfield[@code='w']}">
                        <xsl:value-of select="translate($f785, '()', '')"/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <a><xsl:attribute name="href">/cgi-bin/koha/opac-search.pl?q=<xsl:value-of select="translate($f785, '()', '')"/></xsl:attribute>
                        <xsl:value-of select="translate($f785, '()', '')"/>
                    </a>
                </xsl:otherwise>
            </xsl:choose>

        </span>
        </xsl:for-each>
        </xsl:if>

    </xsl:template>

    <xsl:template name="nameABCDQ">
            <xsl:call-template name="chopPunctuation">
                <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">aq</xsl:with-param>
                    </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="punctuation">
                    <xsl:text>:,;/ </xsl:text>
                </xsl:with-param>
            </xsl:call-template>
        <xsl:call-template name="termsOfAddress"/>
    </xsl:template>

    <xsl:template name="nameABCDN">
        <xsl:for-each select="marc:subfield[@code='a']">
                <xsl:call-template name="chopPunctuation">
                    <xsl:with-param name="chopString" select="."/>
                </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="marc:subfield[@code='b']">
                <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:if test="marc:subfield[@code='c'] or marc:subfield[@code='d'] or marc:subfield[@code='n']">
                <xsl:call-template name="subfieldSelect">
                    <xsl:with-param name="codes">cdn</xsl:with-param>
                </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="nameACDEQ">
            <xsl:call-template name="subfieldSelect">
                <xsl:with-param name="codes">acdeq</xsl:with-param>
            </xsl:call-template>
    </xsl:template>
    <xsl:template name="termsOfAddress">
        <xsl:if test="marc:subfield[@code='b' or @code='c']">
            <xsl:call-template name="chopPunctuation">
                <xsl:with-param name="chopString">
                    <xsl:call-template name="subfieldSelect">
                        <xsl:with-param name="codes">bc</xsl:with-param>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="part">
        <xsl:variable name="partNumber">
            <xsl:call-template name="specialSubfieldSelect">
                <xsl:with-param name="axis">n</xsl:with-param>
                <xsl:with-param name="anyCodes">n</xsl:with-param>
                <xsl:with-param name="afterCodes">fghkdlmor</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="partName">
            <xsl:call-template name="specialSubfieldSelect">
                <xsl:with-param name="axis">p</xsl:with-param>
                <xsl:with-param name="anyCodes">p</xsl:with-param>
                <xsl:with-param name="afterCodes">fghkdlmor</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="string-length(normalize-space($partNumber))">
                <xsl:call-template name="chopPunctuation">
                    <xsl:with-param name="chopString" select="$partNumber"/>
                </xsl:call-template>
        </xsl:if>
        <xsl:if test="string-length(normalize-space($partName))">
                <xsl:call-template name="chopPunctuation">
                    <xsl:with-param name="chopString" select="$partName"/>
                </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="specialSubfieldSelect">
        <xsl:param name="anyCodes"/>
        <xsl:param name="axis"/>
        <xsl:param name="beforeCodes"/>
        <xsl:param name="afterCodes"/>
        <xsl:variable name="str">
            <xsl:for-each select="marc:subfield">
                <xsl:if test="contains($anyCodes, @code)      or (contains($beforeCodes,@code) and following-sibling::marc:subfield[@code=$axis])      or (contains($afterCodes,@code) and preceding-sibling::marc:subfield[@code=$axis])">
                    <xsl:value-of select="text()"/>
                    <xsl:text> </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="substring($str,1,string-length($str)-1)"/>
    </xsl:template>
</xsl:stylesheet>