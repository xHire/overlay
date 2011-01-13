# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit perl-helper

DESCRIPTION="Collection of tools for generating and manipulating MobiPocket files"
HOMEPAGE="https://dev.mobileread.com/trac/mobiperl"
SRC_URI="https://dev.mobileread.com/dist/tompe/mobiperl/${P}.tar"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="perl-core/Encode
	dev-perl/GD
	dev-perl/Getopt-Mixed
	dev-perl/HTML-Tree
	dev-perl/ImageSize
	dev-perl/Image-BMP
	dev-perl/p5-Palm
	dev-perl/Palm-Doc
	dev-perl/TimeDate
	dev-perl/URI
	dev-perl/XML-Parser-Lite-Tree"
RDEPEND="${DEPEND}"

src_compile() {
	# build man pages
	mkdir man
	for pod in html2mobi lit2mobi mobi2html mobi2mobi mobils opf2mobi; do
		pod2man $pod > man/$pod.1 || die "pod2man"
	done

	# build html documentation
	if use doc; then
		mkdir html
		for pod in html2mobi lit2mobi mobi2html mobi2mobi mobils opf2mobi; do
			pod2html $pod > html/$pod.html || die "pod2html"
		done
	fi
}

src_install() {
	dobin mobi2html html2mobi lit2mobi mobi2mobi opf2mobi mobils || die "dobin"
	doman man/* || die "doman"
	use doc && {
		dohtml html/* || die "dohtml"
	}
	newdoc README CHANGELOG || die "newdoc"

	perl_set_version
	insinto ${VENDOR_LIB}
	dodir ${VENDOR_LIB}/MobiPerl
	insinto ${VENDOR_LIB}/MobiPerl
	doins MobiPerl/* || die "doins"
}
