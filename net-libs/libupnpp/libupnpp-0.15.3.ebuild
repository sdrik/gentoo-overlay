# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="C++ library wrapper around libupnp"
HOMEPAGE="http://www.lesbonscomptes.com/upmpdcli/"
SRC_URI="http://www.lesbonscomptes.com/upmpdcli/downloads/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-libs/libupnp:=
	net-misc/curl:=
	dev-libs/expat:=
"
RDEPEND="${DEPEND}"
