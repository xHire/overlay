# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="GUI to access Czech eGov \"Datove schranky\""
HOMEPAGE="https://labs.nic.cz/cs/datovka.html"
SRC_URI="https://secure.nic.cz/files/datove_schranky/${PV}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-libs/libisds[openssl]
	dev-libs/openssl:0
	>=dev-qt/qtgui-5.3.0:5
	>=dev-qt/qtwidgets-5.3.0:5
	>=dev-qt/qtprintsupport-5.3.0:5
	>=dev-qt/qtsql-5.3.0:5[sqlite]
	dev-libs/libxml2
	dev-libs/libpcre
	dev-libs/icu
	media-libs/harfbuzz
	dev-libs/expat
	media-libs/libpng
"
RDEPEND="${DEPEND}"

src_configure() {
	/usr/lib/qt5/bin/lrelease datovka.pro
	/usr/lib/qt5/bin/qmake INSTALL_PREFIX=/usr PREFIX=/usr datovka.pro
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${D}" install
}
