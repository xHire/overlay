# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

S=${WORKDIR}/PerlPanel
ECVS_SERVER="cvs.savannah.nongnu.org:/sources/${PN}"
ECVS_MODULE="PerlPanel"

inherit base cvs

DESCRIPTION="Lightweight panel for *box GUI"
HOMEPAGE="http://savannah.nongnu.org/projects/perlpanel"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="volume"
LINGUAS="de en"

RDEPEND=">=x11-libs/gtk+-2.4.0
		 gnome-base/libglade
		 >=dev-lang/perl-5.8.0
		 dev-perl/gtk2-perl
		 dev-perl/gtk2-gladexml
		 dev-perl/gtk2-traymanager
		 dev-perl/gnome2-wnck
		 dev-perl/gnome2-vfs-perl
		 dev-perl/Locale-gettext
		 dev-perl/XML-Simple
		 dev-perl/XML-Parser
		 dev-perl/DateManip
		 dev-perl/X11-FreeDesktop-DesktopEntry
		 volume? (
		 	dev-perl/Audio-Mixer
		 )"
DEPEND="${RDEPEND}"

src_compile() {
	emake PREFIX=/usr || die "emake PREFIX=/usr failed"
}

src_install() {
	emake PREFIX=/usr DESTDIR=${D} install || die "emake PREFIX=/usr DESTDIR=${D} install failed"

	# remove CVS directories
	find ${D} -type d -name CVS -print | xargs -i rm -rf {}

	! use volume && {
		rm -f ${D}/usr/lib/${PN}/PerlPanel/Applet/Volume.pm
		rm -f ${D}/usr/share/icons/hicolor/48x48/${PN}-applet-volume.png
		rm -f ${D}/usr/share/icons/Bluecurve/48x48/apps/${PN}-applet-volume.png
	}
}
