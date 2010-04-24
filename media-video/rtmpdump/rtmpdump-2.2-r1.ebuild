# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit toolchain-funcs

DESCRIPTION="Open source command-line RTMP client intended to stream audio or video flash content"
HOMEPAGE="http://rtmpdump.mplayerhq.hu/"
SRC_URI="http://rtmpdump.mplayerhq.hu/download/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
# fix Makefile ( bug #298535 )
	sed -i "s/\$(MAKEFLAGS)/-\$(MAKEFLAGS)/" Makefile \
		|| die "failed to fix Makefile"
}

src_compile() {
	emake CC=$(tc-getCC) LD=$(tc-getLD) \
		OPT="${CFLAGS}" XLDFLAGS="${LDFLAGS}" linux || die "emake failed"
}

src_install() {
	dobin {rtmpdump,rtmpsuck,rtmpsrv,rtmpgw} || die "dobin failed"
	dodoc README ChangeLog rtmpdump.1.html rtmpgw.8.html || die "dodoc failed"
	doman rtmpdump.1 rtmpgw.8
}
