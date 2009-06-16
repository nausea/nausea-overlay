# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${PN}_${PV}"
DESCRIPTION="Simple C++ hash library"
HOMEPAGE="http://hashlib2plus.sourceforge.net"
SRC_URI="mirror://sourceforge/hashlib2plus/${MY_P}.tgz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S="${WORKDIR}/${MY_P}/src"

src_compile() {
	sed -i -e "s:/usr/local:${D}/usr:g" Makefile
	emake || die "emake failed"
}

src_install() {
	dodir /usr/lib
	dodir /usr/include
	emake DESTDIR="${D}" install || die "emake install failed"
}
