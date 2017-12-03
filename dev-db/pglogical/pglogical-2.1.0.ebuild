# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Logical Replication extension for PostgreSQL 9.4, 9.5 and 9.6, providing fast replication, as well as cross-version upgrades."
HOMEPAGE="https://www.2ndquadrant.com/en/resources/pglogical/"
SRC_URI="https://github.com/2ndQuadrant/pglogical/archive/REL${PV//./_}.tar.gz -> ${P}.tar.gz"
#SRC_URI="http://packages.2ndquadrant.com/pglogical/tarballs/${P}.tar.bz2"

S="${WORKDIR}/${PN}-REL${PV//./_}"

LICENSE="POSTGRESQL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| (
		dev-db/postgresql:9.4=[server,static-libs]
		dev-db/postgresql:9.5=[server,static-libs]
		dev-db/postgresql:9.6=[server,static-libs]
	)"
RDEPEND="${DEPEND}"

src_compile() {
	emake USE_PGXS=1
}

src_install() {
	emake DESTDIR="${D}" USE_PGXS=1 install
}
