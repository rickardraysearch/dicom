#!/bin/sh

release=`cat release.txt`
releasedate=`date +%Y%m%d%H%M%S`
releasefilename="DocBookDICOM${release}_sourceandrenderingpipeline_${releasedate}.tar.bz2"

EXCLUDEFILE="/tmp/Exclude.$$.tmp"

rm -f "${EXCLUDEFILE}"
echo '*CVS*' >"${EXCLUDEFILE}"
echo '*.DS_Store' >>"${EXCLUDEFILE}"

tar -X "${EXCLUDEFILE}" -cvf - \
	catalogs/catalog.xml \
	css/dicom.css \
	docbook-xsl-ns-1.78.1 \
	generateallformatsandchangesforonepart.sh \
	generateallformatsforonepart.sh \
	generatechangepdf_foralldftversuslbcps.sh \
	generatechangepdfanddocx_foralldft.sh \
	generatechanges.sh \
	generatechanges_for_CP.sh \
	generatechanges_for_Sup.sh \
	generatechanges_forallparts.sh \
	generatechunkedhtml.sh \
	generatechunkedhtmlforrelease.sh \
	generatecustomizedtitlepagesfo.sh \
	generatecustomizedtitlepagesfopdfcp.sh \
	generatecustomizedtitlepagesfopdfreleasenotes.sh \
	generatecustomizedtitlepagesfopdfsup.sh \
	generatecustomizedtitlepageshtml.sh \
	generatedocx.sh \
	generatedocx_for_CP.sh \
	generatedocx_for_Sup.sh \
	generatedocxforrelease.sh \
	generateforrelease.sh \
	generatehtml.sh \
	generatehtmlforrelease.sh \
	generateodt.sh \
	generateodtforrelease.sh \
	generateolinkdb.sh \
	generateolinkdbchunked.sh \
	generateolinkdbchunkedforrelease.sh \
	generateolinkdbforrelease.sh \
	generatepdf.sh \
	generatepdf_With_Changes.sh \
	generatepdf_With_Changes_forallparts.sh \
	generatepdf_With_Changes_forrelease.sh \
	generatepdf_for_CP.sh \
	generatepdf_for_CP_With_Changes.sh \
	generatepdf_for_Sup.sh \
	generatepdf_for_Sup_With_Changes.sh \
	generatepdfforrelease.sh \
	generatereleasenotes.sh \
	lib \
	makerelease.sh \
	makereleaseofsourceandrenderingpipeline.sh \
	NOTES_rendering \
	olinkdb_chtml.xml \
	olinkdb_html.xml \
	olinkdb_pdf.xml \
	partsforrelease.txt \
	priorrelease.txt \
	release.txt \
	source/docbook/releasenotes/releasenotes_${release}.xml \
	source/docbook/part01/part01.xml \
	source/docbook/part02/part02.xml \
	source/docbook/part03/part03.xml \
	source/docbook/part04/part04.xml \
	source/docbook/part05/part05.xml \
	source/docbook/part06/part06.xml \
	source/docbook/part07/part07.xml \
	source/docbook/part08/part08.xml \
	source/docbook/part10/part10.xml \
	source/docbook/part11/part11.xml \
	source/docbook/part12/part12.xml \
	source/docbook/part14/part14.xml \
	source/docbook/part15/part15.xml \
	source/docbook/part16/part16.xml \
	source/docbook/part17/part17.xml \
	source/docbook/part18/part18.xml \
	source/docbook/part19/part19.xml \
	source/docbook/part20/part20.xml \
	source/docbook/part01/figures \
	source/docbook/part02/figures \
	source/docbook/part03/figures \
	source/docbook/part04/figures \
	source/docbook/part05/figures \
	source/docbook/part06/figures \
	source/docbook/part07/figures \
	source/docbook/part08/figures \
	source/docbook/part10/figures \
	source/docbook/part11/figures \
	source/docbook/part12/figures \
	source/docbook/part14/figures \
	source/docbook/part15/figures \
	source/docbook/part16/figures \
	source/docbook/part17/figures \
	source/docbook/part18/figures \
	source/docbook/part19/figures \
	source/docbook/part20/figures \
	stylesheets/customize-chunk.xsl \
	stylesheets/customize-common.xsl \
	stylesheets/customize-fo-pdf-cp.xsl \
	stylesheets/customize-fo-pdf-cp_with_changes.xsl \
	stylesheets/customize-fo-pdf-releasenotes.xsl \
	stylesheets/customize-fo-pdf-sup.xsl \
	stylesheets/customize-fo-pdf-sup_with_changes.xsl \
	stylesheets/customize-fo.xsl \
	stylesheets/customize-fo_collapse.xsl \
	stylesheets/customize-fo_prensaware.xsl \
	stylesheets/customize-fo_with_changes.xsl \
	stylesheets/customize-html.xsl \
	stylesheets/customized-titlepage.templates-fo-pdf-cp.xml \
	stylesheets/customized-titlepage.templates-fo-pdf-releasenotes.xml \
	stylesheets/customized-titlepage.templates-fo-pdf-sup.xml \
	stylesheets/customized-titlepage.templates-fo.xml \
	stylesheets/customized-titlepage.templates-xhtml.xml \
	stylesheets/customizedtitlepages-fo-pdf-cp.xsl \
	stylesheets/customizedtitlepages-fo-pdf-releasenotes.xsl \
	stylesheets/customizedtitlepages-fo-pdf-sup.xsl \
	stylesheets/customizedtitlepages-fo.xsl \
	stylesheets/customizedtitlepages-xhtml.xsl \
	stylesheets/linenumberxep.xsl \
	updateabsolutepaths.sh \
	wordexport/part01/part01_fromword_files \
	wordexport/part03/part03_fromword_files \
	wordexport/part05/part05_fromword_files \
	wordexport/part06/part06_fromword_files \
	wordexport/part07/part07_fromword_files \
	wordexport/part08/part08_fromword_files \
	wordexport/part10/part10_fromword_files \
	wordexport/part11/part11_fromword_files \
	wordexport/part12/part12_fromword_files \
	wordexport/part14/part14_fromword_files \
	wordexport/part15/part15_fromword_files \
	wordexport/part16/part16_fromword_files \
	wordexport/part17/part17_fromword_files \
	wordexport/part18/part18_fromword_files \
	wordexport/part19/part19_fromword_files \
	wordexport/part20/part20_fromword_files \
	support/stylesheets/extractcompositeiodsfordicom3tooltemplate.xsl \
	support/stylesheets/extractcompositemodulesfordicom3tooltemplate.xsl \
	support/stylesheets/extractcontextgroupsforpixelmed.xsl \
	support/stylesheets/extractdcmconceptswithoutdefinitionforcp.xsl \
	support/stylesheets/extractdcmdefinitionsasowl.xsl \
	support/stylesheets/extractselectedcontextgroupsforXDSeventcodelist.xsl \
	support/stylesheets/extractsrtemplatesforpixelmed.xsl \
	support/stylesheets/extractsrtemplatesrelationshipusage.xsl \
	support/stylesheets/findcodesinannexj.xsl \
	support/stylesheets/findcodesinannexj_replacement.xsl \
	support/stylesheets/findcodesinannexj_retired.xsl \
	support/stylesheets/findcodesinannexl.xsl \
	support/stylesheets/findcodesincontextgroups.xsl \
	support/stylesheets/findcodetuples.xsl \
	support/stylesheets/finddcmconceptswithoutdefinition.xsl \
	XEP_trial \
	pMML2SVG-0.8.5 \
	svg2emf \
	| bzip2 >"${releasefilename}"

rm "${EXCLUDEFILE}"
