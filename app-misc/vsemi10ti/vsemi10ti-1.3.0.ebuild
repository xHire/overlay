# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Vsemi10ti is program for education all ten fingers writing."
HOMEPAGE="http://vsemi10ti.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/sourceforge/${PN}/${P}.tar.bz2"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/libsdl
        media-libs/sdl-image
        media-libs/sdl-mixer
        media-libs/sdl-ttf"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
