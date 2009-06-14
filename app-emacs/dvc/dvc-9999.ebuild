# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils autotools bzr

DESCRIPTION="Emacs decentralized version control extension"
HOMEPAGE="http://download.gna.org/dvc"
EBZR_REPO_URI="http://bzr.xsteve.at/dvc/"
EBZR_BRANCH=""
LICENSE="GPL-2"
IUSE=""

SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --prefix="${D}"/usr --infodir="${D}"/usr/share/info || die "econf failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake install || die "install failed"
}
