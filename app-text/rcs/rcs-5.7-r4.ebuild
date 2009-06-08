# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Revision Control System"
HOMEPAGE="http://www.gnu.org/software/rcs/"
SRC_URI="mirror://gnu/rcs/${P}.tar.gz
	mirror://gentoo/${P}-debian.diff.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="readline"

DEPEND="readline? ( sys-libs/readline )"

RDEPEND="${DEPEND}
	sys-apps/diffutils"

src_unpack() {
	unpack ${A}; cd "${S}"
	epatch "${WORKDIR}"/"${P}"-debian.diff

	if use readline; then
		epatch "${FILESDIR}"/"${PN}"-readline.patch
	fi
}

src_compile() {
	# econf BREAKS this!
	autoheader
	./configure \
		--prefix=/usr \
		--host=${CHOST} \
		--with-diffutils \
		$(use_enable readline) || die

	emake || die
}

src_install() {
	make \
		prefix=${D}/usr \
		man1dir=${D}/usr/share/man/man1 \
		man3dir=${D}/usr/share/man/man3 \
		man5dir=${D}/usr/share/man/man5 \
		install || die

	dodoc ChangeLog CREDITS NEWS README REFS
}
