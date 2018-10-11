# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Fast, threaded, pure C99 HTML Parser library with no outside dependencies."
HOMEPAGE="https://github.com/lexborisov/myhtml"
SRC_URI="https://github.com/lexborisov/myhtml/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples +threads"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	MAKEOPTS="prefix=/usr"
	if use threads; then
		MAKEOPTS="${MAKEOPTS} MyCORE_BUILD_WITHOUT_THREADS=YES"
	else
		MAKEOPTS="${MAKEOPTS} MyCORE_BUILD_WITHOUT_THREADS=NO"
	fi

	# do not build examples -- there is no point in doing that
	MAKEOPTS="${MAKEOPTS} BUILD_SUB_DIRS="

	# FIXME: SONAME
	# https://dev.gentoo.org/~zmedico/portage/doc/ch07s04.html

	emake $MAKEOPTS
}

src_install() {
	emake prefix="${D}"usr install || die "emake install"

	# fix permissions
	chmod -x "${D}"usr/include/${PN}/api.h

	# rename .so files according to the convention
	rm -fv "${D}"usr/lib/lib${PN}{,-${PV%%.*},-${PV%.*}}.so
	mv "${D}"usr/lib/{lib${P}.so,lib${PN}.so.${PV}}
	cd "${D}"usr/lib/
	ln -sv lib${PN}.so.${PV} lib${PN}.so
	ln -sv lib${PN}.so.${PV} lib${PN}.so.${PV%%.*}
	ln -sv lib${PN}.so.${PV} lib${PN}.so.${PV%.*}
	cd -

	# install pkg-config file
	install -Dm644 myhtml.pc "${D}"/usr/lib/pkgconfig/myhtml.pc

	use examples && {
		insinto /usr/share/${PN}/examples
		doins examples/${PN}/*.c || die "doins"
	}

	dodoc README.md
}
