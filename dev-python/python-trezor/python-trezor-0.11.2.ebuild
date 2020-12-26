# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 python3_5 python3_6 python3_7 )
inherit distutils-r1

MY_PN="${PN#python-}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Client side implementation for TREZOR-compatible Bitcoin hardware wallets."
HOMEPAGE="https://github.com/trezor/python-trezor"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

S="${WORKDIR}/${MY_P}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-python/click-7[${PYTHON_USEDEP}]
	<dev-python/click-8[${PYTHON_USEDEP}]
	>=dev-python/construct-2.9[${PYTHON_USEDEP}]
	>=dev-python/ecdsa-0.9[${PYTHON_USEDEP}]
	>=dev-python/hidapi-0.7.99.20[${PYTHON_USEDEP}]
	>=dev-python/libusb1-1.6.4[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-mnemonic-0.17[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.6[${PYTHON_USEDEP}]"
	#>=dev-python/pyblake2-0.9.3[${PYTHON_USEDEP}]	# built-in since 3.6
DEPEND="${RDEPEND}
	>=dev-python/setuptools-19.0[${PYTHON_USEDEP}]"

# this is not ready yet (and would break electrum) [untested for this version]
#python_compile() {
#	distutils-r1_python_compile --disable-hidapi
#}
