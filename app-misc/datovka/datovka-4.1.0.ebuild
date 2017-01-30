# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/datovka/datovka-3.0.3-r1.ebuild,v 1.1 2013/03/05 15:34:22 scarabeus Exp $

EAPI=5

DESCRIPTION="GUI to access Czech eGov \"Datove schranky\""
HOMEPAGE="http://labs.nic.cz/page/969/datovka/"
SRC_URI="https://secure.nic.cz/files/datove_schranky/${PV}/${P}-src.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-libs/libisds[openssl]
	dev-libs/openssl:0
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsql:5
	dev-libs/libxml2
	dev-libs/libpcre
	dev-libs/icu
	media-libs/harfbuzz
	dev-libs/expat
	media-libs/libpng
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_configure() {
	/usr/lib/qt5/bin/qmake INSTALL_PREFIX=/usr PREFIX=/usr
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${D}" install
}
