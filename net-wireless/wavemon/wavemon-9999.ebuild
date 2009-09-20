# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils git

DESCRIPTION="Ncurses based monitor for IEEE 802.11 wireless LAN cards"
HOMEPAGE="http://eden-feed.erg.abdn.ac.uk/wavemon/"
EGIT_REPO_URI="git://eden-feed.erg.abdn.ac.uk/wavemon.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86"

IUSE=""
DEPEND="sys-libs/ncurses"

src_compile() {
	CC=$(tc-getCC) econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	dodir /usr/bin /usr/share/man/{man1,man5}

	make prefix="${D}"/usr mandir="${D}"/usr/share/man install \
		|| die "make install failed"

	dodoc AUTHORS README
}
