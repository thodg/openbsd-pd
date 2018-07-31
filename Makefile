# $OpenBSD: $

COMMENT =	real-time software system for music and multimedia

VER =		0.48
DISTNAME =	${VER}-1
PKGNAME =	pd-${VER}.1
CATEGORIES =	audio
MASTER_SITES =	https://github.com/pure-data/pure-data/archive/
EXTRACT_SUFX =	.tar.gz

HOMEPAGE =	https://github.com/pure-data/pure-data

MAINTAINER =	Thomas de Grivel <thoxdg@gmail.com>

# MIT
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB+= ${COMPILER_LIBCXX} m pthread

LIB_DEPENDS+=	audio/portaudio-svn
WANTLIB+=	portaudio

LIB_DEPENDS+=	math/fftw3,float
WANTLIB+= 	fftw3f

BUILD_DEPENDS+=	x11/tk/8.5
RUN_DEPENDS+=	x11/tk/8.5

BUILD_DEPENDS+=	devel/autoconf/2.69
BUILD_DEPENDS+= devel/automake/1.15
BUILD_DEPENDS+= devel/gettext-tools

COMPILER = ports-gcc

CONFIGURE_STYLE =	gnu

CONFIGURE_ARGS =	--without-local-portaudio \
			--with-wish=/usr/local/bin/wish8.5 \
			CFLAGS="-I/usr/local/include" \
			LIBS="-L/usr/local/lib" \
			CC=egcc CXX=eg++

MAKE_ENV =		AUTOCONF_VERSION=2.69 \
			AUTOMAKE_VERSION=1.15

USE_GMAKE = Yes

WRKDIST =	${WRKDIR}/pure-data-${VER}-1

pre-configure:
	cd ${WRKSRC} && ${MAKE_ENV} ./autogen.sh

.include <bsd.port.mk>
