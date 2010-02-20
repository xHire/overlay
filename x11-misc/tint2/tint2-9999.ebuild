# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs eutils subversion

DESCRIPTION="A lightweight panel/taskbar"
HOMEPAGE="http://code.google.com/p/tint2/"
ESVN_REPO_URI="http://tint2.googlecode.com/svn/trunk/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="battery examples tint2conf"

RDEPEND="dev-libs/glib:2
	x11-libs/cairo
	x11-libs/pango
	x11-libs/libX11
	x11-libs/libXinerama
	media-libs/imlib2[X]
	tint2conf? ( >=dev-python/pygtk-2.0 )
	!x11-misc/tint"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	x11-proto/xineramaproto"

src_unpack() {
	subversion_src_unpack
	./autogen.sh || die "autogen.sh failed"
}

src_compile() {
	econf $(use_enable battery) \
		  $(use_enable examples) \
		  $(use_enable tint2conf) \
		  || die "econf failed"

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
