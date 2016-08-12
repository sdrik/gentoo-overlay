# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Virtual dependencies for MythTV"

SLOT="0"
KEYWORDS="amd64 x86"

IUSE_INPUT_DEVICES="input_devices_joystick"
IUSE="qt5 alsa altivec libass autostart bluray cec dvb dvd \
egl fftw +hls ieee1394 jack lcd lirc perl pulseaudio python raop +theora \
vaapi vdpau +vorbis +xml xmltv +xvid ${IUSE_INPUT_DEVICES}"

REQUIRED_USE="
	bluray? ( xml )
	theora? ( vorbis )"

RDEPEND="
	>=media-libs/freetype-2.0:=
	sys-libs/zlib:=
	x11-libs/libX11:=
	x11-libs/libXext:=
	x11-libs/libXinerama:=
	x11-libs/libXv:=
	x11-libs/libXrandr:=
	x11-libs/libXxf86vm:=
	qt5? (
		>=dev-qt/qtcore-5.4.1:5=
		>=dev-qt/qtxml-5.4.1:5=
		>=dev-qt/qtdbus-5.4.1:5=
		>=dev-qt/qtgui-5.4.1:5=
		>=dev-qt/qtscript-5.4.1:5=
		>=dev-qt/qtsql-5.4.1:5=[mysql]
		>=dev-qt/qtopengl-5.4.1:5=
		>=dev-qt/qtwebkit-5.4.1:5=
	)
	!qt5? (
		>=dev-qt/qtcore-4.7.2:4=
		>=dev-qt/qtdbus-4.7.2:4=
		>=dev-qt/qtgui-4.7.2:4=
		>=dev-qt/qtscript-4.7.2:4=
		>=dev-qt/qtsql-4.7.2:4=[mysql]
		>=dev-qt/qtopengl-4.7.2:4=[egl?]
		>=dev-qt/qtwebkit-4.7.2:4=
	)
	x11-misc/wmctrl:=
	virtual/mysql:=
	virtual/opengl:=
	alsa? ( >=media-libs/alsa-lib-1.0.24:= )
	bluray? (
		dev-libs/libcdio:=
		media-libs/libbluray:=
	)
	cec? ( dev-libs/libcec:= )
	dvb? (
		media-libs/libdvb:=
		virtual/linuxtv-dvb-headers:=
	)
	dvd? ( dev-libs/libcdio:= )
	egl? ( media-libs/mesa:=[egl] )
	fftw? ( sci-libs/fftw:3.0= )
	hls? (
		media-libs/faac:=
		media-libs/libvpx:=
		>=media-libs/x264-0.0.20111220:=
		>=media-sound/lame-3.93.1
	)
	ieee1394? (
		>=sys-libs/libraw1394-1.2.0:=
		>=sys-libs/libavc1394-0.5.3:=
		>=media-libs/libiec61883-1.0.0:=
	)
	jack? ( media-sound/jack-audio-connection-kit )
	lcd? ( app-misc/lcdproc )
	libass? ( >=media-libs/libass-0.9.11:= )
	lirc? ( app-misc/lirc )
	perl? (
		dev-perl/DBD-mysql
		dev-perl/Net-UPnP
		dev-perl/LWP-Protocol-https
		dev-perl/HTTP-Message
		dev-perl/IO-Socket-INET6
		>=dev-perl/libwww-perl-5
	)
	pulseaudio? ( media-sound/pulseaudio )
	python? (
		dev-python/mysql-python
		dev-python/lxml
		dev-python/urlgrabber
	)
	raop? (
		dev-libs/openssl:=
		net-dns/avahi[mdnsresponder-compat]
	)
	theora? ( media-libs/libtheora:= media-libs/libogg:= )
	vaapi? ( x11-libs/libva:=[opengl] )
	vdpau? ( x11-libs/libvdpau:= )
	vorbis? ( >=media-libs/libvorbis-1.0:= media-libs/libogg:= )
	xml? ( >=dev-libs/libxml2-2.6.0:= )
	xvid? ( >=media-libs/xvid-1.1.0:= )
	!media-tv/mythtv-bindings
	!x11-themes/mythtv-themes
	media-libs/taglib:=
	dev-libs/glib:=
	media-fonts/corefonts
	media-fonts/dejavu
	media-fonts/liberation-fonts
	x11-apps/xinit
	autostart? (
		net-dialup/mingetty
		x11-wm/evilwm
		x11-apps/xset
	)
	dvd? ( media-libs/libdvdcss:= )
	xmltv? ( >=media-tv/xmltv-0.5.43 )
	dev-lang/yasm
	x11-proto/xineramaproto
	x11-proto/xf86vidmodeproto
	media-gfx/exiv2
	"
