# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

MODULE_AUTHOR=CPB
inherit perl-module

DESCRIPTION="Handler for Palm Doc books"
HOMEPAGE=""

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

SRC_TEST="do"

RDEPEND="dev-perl/p5-Palm"
DEPEND="${RDEPEND}
	test? (
		perl-core/Test-Simple
		perl-core/Encode
	)"
