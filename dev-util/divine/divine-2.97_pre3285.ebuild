# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

DESCRIPTION="DiVinE is a modern explicit-state model checker."
HOMEPAGE="http://divine.fi.muni.cz/"
SRC_URI="http://divine.fi.muni.cz/hydra/build/2433020/download/1/divine-2.97+pre3285.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mpi +amd64 x86"

RDEPEND=""
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use mpi MPI)
		$(cmake-utils_use amd64 USE64)
		$(cmake-utils_use x86 USE32)
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}

# FIXME: don't install these files:
# /usr/AUTHORS.txt
# /usr/COPYING.txt
# /usr/NEWS.tx
# /usr/README.txt
