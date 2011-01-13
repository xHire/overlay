# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MODULE_AUTHOR=FERREIRA
inherit perl-module

DESCRIPTION="Implements default import method for modules"
HOMEPAGE="http://search.cpan.org/dist/Exporter/"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

SRC_TEST="do"

RDEPEND=""
DEPEND="${RDEPEND}
	test? (
		>=dev-perl/Test-Pod-1.18
		perl-core/Test-Simple
	)"
