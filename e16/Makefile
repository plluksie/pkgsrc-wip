# $NetBSD: Makefile,v 1.1 2014/09/04 21:00:30 anielski Exp $
#

DISTNAME=	e16-1.0.14
CATEGORIES=	x11 wm
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=enlightenment/}

MAINTAINER=	aniou@smutek.pl
HOMEPAGE=	http://enlightenment.org/
COMMENT=	Highly themeable and configurable window manager
LICENSE=	2-clause-bsd

USE_TOOLS+=		bison perl:run pkg-config gmake
USE_PKGLOCALEDIR=	YES
GNU_CONFIGURE=		YES
CONFIGURE_ARGS+=	--enable-xrandr
CONFIGURE_ARGS+=	--enable-xft
CONFIGURE_ARGS+=	--disable-composite
CONFIGURE_ARGS+=	--enable-sound-esound
CONFIGURE_ARGS+=	--with-sndldr=audiofile
MAKE_ENV+=		USER=${SHAREOWN}:${SHAREGRP}

INSTALL_MAKE_FLAGS+=	sesmdir=${WRKDIR}/.tmp

REPLACE_PERL=		sample-scripts/bouncingball.pl
REPLACE_PERL+=		sample-scripts/testroller.pl
REPLACE_PERL+=		sample-scripts/shade-pagers.pl
REPLACE_PERL+=		scripts/e_gen_menu

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	pre-configure
SUBST_FILES.paths=	scripts/e_gen_menu
SUBST_SED.paths+=	-e 's,@PREFIX@,${PREFIX},g'
SUBST_SED.paths+=	-e 's,@X11BASE@,${X11BASE},g'

PLIST_VARS+=	libhack

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "DragonFly" || ${OPSYS} == "SunOS"
PLIST.libhack=	yes
.endif

post-install:
	${FIND} ${DESTDIR}${PREFIX}/share/e16/themes -type d -print | \
		${XARGS} ${CHMOD} ${BINMODE}
	${FIND} ${DESTDIR}${PREFIX}/share/e16/themes -type f -print | \
		${XARGS} ${CHMOD} ${SHAREMODE}

.include "../../audio/esound/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/imlib2/buildlink3.mk"
.include "../../x11/xbitmaps/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/libXxf86vm/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
