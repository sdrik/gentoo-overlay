# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools systemd user

DESCRIPTION="An UPnP front-end to MPD"
HOMEPAGE="http://www.lesbonscomptes.com/upmpdcli/"
SRC_URI="http://www.lesbonscomptes.com/upmpdcli/downloads/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-libs/libupnpp:=
	media-libs/libmpdclient:=
	net-libs/libmicrohttpd:=
	dev-libs/jsoncpp:=
"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install
	einstalldocs
	systemd_dounit systemd/upmpdcli.service
}

pkg_postinst() {
	enewgroup upmpdcli
	enewuser upmpdcli -1 -1 /dev/null upmpdcli
}
