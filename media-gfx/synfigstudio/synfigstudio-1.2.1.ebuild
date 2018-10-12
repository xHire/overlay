# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Film-Quality Vector Animation (main UI)"
HOMEPAGE="https://www.synfig.org/"
SRC_URI="mirror://sourceforge/synfig/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sys-devel/libtool-1.3.5
	dev-cpp/gtkmm:3.0
	>=dev-libs/libsigc++-2.0
	>=media-gfx/synfig-${PV}"

RDEPEND="${DEPEND}"

src_install() {
	default

	#rm -v "${D}"/usr/share/mime/{magic,types,mime.cache,aliases,generic-icons,subclasses,XMLnamespaces,treemagic,globs{,2},version,icons}
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
