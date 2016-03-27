# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

if [ ${PV} == "9999" ] ; then
	AUTOTOOLS_AUTORECONF=1
	inherit autotools-utils git-r3
	EGIT_REPO_URI="git://github.com/sdrik/dvbsnoop.git"
else
	inherit autotools-utils
	SRC_URI="mirror://sourceforge/dvbsnoop/${P}.tar.gz"
fi

DESCRIPTION="DVB/MPEG stream analyzer program"
HOMEPAGE="http://dvbsnoop.sourceforge.net/"
LICENSE="GPL-2"
KEYWORDS="amd64 ~ppc x86"
DEPEND="virtual/linuxtv-dvb-headers"

DOCS=(AUTHORS ChangeLog README)
PATCHES=( "${FILESDIR}"/${P}-crc32.patch )

RDEPEND=""
SLOT="0"
IUSE=""
