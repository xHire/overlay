# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MODULE_AUTHOR=DAVEOLA
MODULE_SECTION="Image"
inherit perl-module

DESCRIPTION="Bitmap parser/viewer"
HOMEPAGE="http://search.cpan.org/dist/Image-BMP/"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="perl-core/IO
	dev-perl/Exporter"
DEPEND="${RDEPEND}"
