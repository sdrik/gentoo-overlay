# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

# git diff --relative=mythtv v0.27.6.. > ~/mythtv-0.27.6/patches/mythtv.patch
BACKPORTS="03f44039848bd09444ff4baa8dc158bd61454079"
MY_P=${P%_p*}
MY_PV=${PV%_p*}

inherit python-single-r1

MYTHTV_BRANCH="fixes/0.28"

DESCRIPTION="Homebrew PVR project (virtual package for pulling dependencies)"
HOMEPAGE="https://www.mythtv.org"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0/${PV}"

IUSE_INPUT_DEVICES="input_devices_joystick"
IUSE="alsa altivec autostart bluray cec crystalhd debug dvb dvd egl fftw +hls \
ieee1394 jack lcd libass lirc +mythlogserver perl pulseaudio python systemd +theora \
vaapi vdpau +vorbis +wrapper +xml xmltv +xvid zeroconf ${IUSE_INPUT_DEVICES}"

REQUIRED_USE="${PYTHON_REQUIRED_USE}
	bluray? ( xml )
	theora? ( vorbis )"

COMMON="
	dev-libs/glib:2
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtscript:5
	dev-qt/qtsql:5[mysql]
	dev-qt/qtopengl:5
	dev-qt/qtwebkit:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	media-gfx/exiv2:=
	media-libs/freetype:2
	media-libs/taglib
	>=media-sound/lame-3.93.1
	sys-libs/zlib
	virtual/mysql
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXinerama
	x11-libs/libXv
	x11-libs/libXrandr
	x11-libs/libXxf86vm
	x11-misc/wmctrl
	alsa? ( >=media-libs/alsa-lib-1.0.24 )
	bluray? (
		dev-libs/libcdio:=
		media-libs/libbluray:=
		sys-fs/udisks:2
	)
	cec? ( dev-libs/libcec )
	dvb? ( virtual/linuxtv-dvb-headers )
	dvd? (
		dev-libs/libcdio:=
		sys-fs/udisks:2
	)
	egl? ( media-libs/mesa[egl] )
	fftw? ( sci-libs/fftw:3.0= )
	hls? (
		media-libs/faac
		<media-libs/libvpx-1.7.0:=
		>=media-libs/x264-0.0.20111220:=
	)
	ieee1394? (
		>=media-libs/libiec61883-1.0.0
		>=sys-libs/libavc1394-0.5.3
		>=sys-libs/libraw1394-1.2.0
	)
	jack? ( media-sound/jack-audio-connection-kit )
	lcd? ( app-misc/lcdproc )
	libass? ( >=media-libs/libass-0.9.11:= )
	lirc? ( app-misc/lirc )
	perl? (
		>=dev-perl/libwww-perl-5
		dev-perl/DBD-mysql
		dev-perl/HTTP-Message
		dev-perl/IO-Socket-INET6
		dev-perl/LWP-Protocol-https
		dev-perl/Net-UPnP
	)
	pulseaudio? ( media-sound/pulseaudio )
	python? (
		${PYTHON_DEPS}
		dev-python/lxml
		dev-python/mysql-python
		dev-python/urlgrabber
		>=dev-python/future-0.15.2
		>=dev-python/requests-2.9.1
		>=dev-python/requests-cache-0.4.10
		>=dev-python/urllib3-1.13.1
	)
	systemd? ( sys-apps/systemd:= )
	theora? ( media-libs/libtheora media-libs/libogg )
	vaapi? ( x11-libs/libva[opengl] )
	vdpau? ( x11-libs/libvdpau )
	vorbis? ( >=media-libs/libvorbis-1.0 media-libs/libogg )
	xml? ( >=dev-libs/libxml2-2.6.0 )
	xvid? ( >=media-libs/xvid-1.1.0 )
	zeroconf? (
		dev-libs/openssl:0=
		net-dns/avahi[mdnsresponder-compat]
	)
"
RDEPEND="${COMMON}
	!media-tv/mythtv-bindings
	!x11-themes/mythtv-themes
	media-fonts/corefonts
	media-fonts/dejavu
	media-fonts/liberation-fonts
	x11-apps/xinit
	autostart? (
		net-dialup/mingetty
		x11-apps/xset
		x11-wm/evilwm
	)
	dvd? ( media-libs/libdvdcss )
	xmltv? ( >=media-tv/xmltv-0.5.43 )
	dev-lang/yasm
	x11-proto/xf86vidmodeproto
	x11-proto/xineramaproto
"
