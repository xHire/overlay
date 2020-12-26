# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 python3_5 python3_6 python3_7 python3_8 )
inherit distutils-r1

MAIN_PV="${PV%.*}"
POST_PV="${PV##*.}"
MY_PV="${MAIN_PV}.post${POST_PV}"

DESCRIPTION="Python wrapper for the hidapi"
HOMEPAGE="https://github.com/trezor/cython-hidapi"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${MY_PV}.tar.gz"

S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-python/cython-0.24[${PYTHON_USEDEP}]
	virtual/libusb:1
	virtual/libudev"
DEPEND="${RDEPEND}
	>=dev-python/setuptools-19.0[${PYTHON_USEDEP}]"

python_test() {
	esetup.py check
}
