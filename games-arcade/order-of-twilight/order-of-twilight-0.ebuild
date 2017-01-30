# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit games

DESCRIPTION="You use your arrow keys to cast a number of different spells to help you progress through the levels"
HOMEPAGE="http://stabyourself.net/orderoftwilight/"
SRC_URI="http://stabyourself.net/dl.php?file=orderoftwilight/orderoftwilight-source.zip"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	 games-engines/love"

S=${WORKDIR}

src_prepare() {
	unpack ${A}
	cp "${FILESDIR}/${PN}" . || die "cp failed!"
	sed -i -e "s|@@GAMEDIR@@|${GAMES_DATADIR}/${PN}|" ${PN} || die "Sed failed!"
}

src_install() {
	dogamesbin ${PN}

	insinto "${GAMES_DATADIR}"/${PN}
	doins Order_of_Twilight.love

	prepgamesdirs
}
