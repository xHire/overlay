# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Film-Quality Vector Animation (core engine)"
HOMEPAGE="https://www.synfig.org/"
SRC_URI="mirror://sourceforge/synfig/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="dv examples +ffmpeg +fontconfig +imagemagick +jpeg +openexr +tiff +truetype"

DEPEND=">=dev-libs/libsigc++-2.0.0
	dev-cpp/libxmlpp:2.6
	media-libs/mlt
	media-libs/libpng
	sci-libs/fftw
	>=dev-cpp/ETL-1.2.2
	ffmpeg? ( virtual/ffmpeg )
	openexr? ( media-libs/openexr )
	truetype? ( media-libs/freetype )
	fontconfig? ( media-libs/fontconfig )
	jpeg? ( virtual/jpeg )
	tiff? ( media-libs/tiff )"

RDEPEND="${DEPEND}
	dv? ( media-libs/libdv )
	imagemagick? ( media-gfx/imagemagick )"

src_configure() {
	econf \
		$(use_with ffmpeg) \
		$(use_with fontconfig) \
		$(use_with imagemagick) \
		$(use_with dv libdv) \
		$(use_with openexr ) \
		$(use_with truetype freetype) \
		$(use_with jpeg)
}

src_install() {
	default
	dodoc doc/*.txt || die "Dodoc failed!"
	use examples && {
		insinto /usr/share/${PN}/examples
		doins examples/*.sifz || die "Doins failed!"
	}
}
