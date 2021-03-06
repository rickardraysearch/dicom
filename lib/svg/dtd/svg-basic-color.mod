<!-- ....................................................................... -->
<!-- SVG 1.1 Basic Color Module ............................................ -->
<!-- file: svg-basic-color.mod

     This is SVG, a language for describing two-dimensional graphics in XML.
     Copyright 2001, 2002 W3C (MIT, INRIA, Keio), All Rights Reserved.
     Revision: $Id: svg-basic-color.mod,v 1.1 2014/01/12 16:00:41 dclunie Exp $

     This DTD module is identified by the PUBLIC and SYSTEM identifiers:

        PUBLIC "-//W3C//ELEMENTS SVG 1.1 Basic Color//EN"
        SYSTEM "http://www.w3.org/TR/SVG11/DTD/svg-basic-color.mod"

     ....................................................................... -->

<!-- Basic Color

        color-profile

     This module declares markup to provide support for color.
-->

<!-- Qualified Names (Default) ......................... -->

<!ENTITY % SVG.color-profile.qname "color-profile" >

<!-- Attribute Collections (Default) ................... -->

<!ENTITY % SVG.Core.attrib "" >
<!ENTITY % SVG.XLink.attrib "" >

<!-- SVG.Color.class ................................... -->

<!ENTITY % SVG.Color.extra.class "" >

<!ENTITY % SVG.Color.class
    "| %SVG.color-profile.qname; %SVG.Color.extra.class;"
>

<!-- SVG.Color.attrib .................................. -->

<!ENTITY % SVG.Color.extra.attrib "" >

<!ENTITY % SVG.Color.attrib
    "color %Color.datatype; #IMPLIED
     %SVG.Color.extra.attrib;"
>

<!-- color-profile: Color Profile Element .............. -->

<!ENTITY % SVG.color-profile.element "INCLUDE" >
<![%SVG.color-profile.element;[
<!ENTITY % SVG.color-profile.content
    "( %SVG.Description.class; )*"
>
<!ELEMENT %SVG.color-profile.qname; %SVG.color-profile.content; >
<!-- end of SVG.color-profile.element -->]]>

<!ENTITY % SVG.color-profile.attlist "INCLUDE" >
<![%SVG.color-profile.attlist;[
<!ATTLIST %SVG.color-profile.qname;
    %SVG.Core.attrib;
    %SVG.XLink.attrib;
    local CDATA #IMPLIED
    name CDATA #REQUIRED
    rendering-intent ( auto | perceptual | relative-colorimetric | saturation |
                       absolute-colorimetric ) 'auto'
>
<!-- end of SVG.color-profile.attlist -->]]>

<!-- end of svg-basic-color.mod -->
