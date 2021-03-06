# $NetBSD: Makefile,v 1.154 2015/10/10 01:57:53 ryoon Exp $

DISTNAME=	evolution-data-server-3.18.4
CATEGORIES=	mail gnome
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/evolution-data-server/3.18/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.gnome.org/projects/evolution/
COMMENT=	Evolution data server
LICENSE=	gnu-lgpl-v2

BUILD_DEPENDS+=	gdbus-codegen-[0-9]*:../../devel/gdbus-codegen

BDB_ACCEPTED=		db4 db5
USE_TOOLS+=		bison gmake intltool msgfmt pkg-config
USE_LANGUAGES=		c c++
USE_LIBTOOL=		YES
USE_PKGLOCALEDIR=	YES
GNU_CONFIGURE=		YES

PYTHON_FOR_BUILD_ONLY=	YES
REPLACE_PYTHON=		addressbook/libebook/gen-western-table.py

.include "options.mk"

.include "../../mk/bsd.prefs.mk"

CFLAGS+=	-D_NETBSD_SOURCE

CONFIGURE_ENV+=		PTHREAD_LIB=${PTHREAD_LDFLAGS:M*:Q} ${PTHREAD_LIBS:M*:Q}

.if ${OPSYS} == "NetBSD" && !empty(OS_VERSION:M1.6.2)
.include "../../devel/pthread-sem/buildlink3.mk"
LIBS+=		-lsemaphore
.endif
.if (${OPSYS} == "NetBSD" && !empty(OS_VERSION:M4.*) || ${OPSYS} == "Darwin")
BUILDLINK_TRANSFORM+=   rm:-Wl,--no-undefined
.endif

.if ${OPSYS} == "Darwin"
CPPFLAGS+=	-DBIND_8_COMPAT
.endif

.if !empty(PKGSRC_COMPILER:Msunpro)
CFLAGS.SunOS+=	-D__FUNCTION__=__func__
.endif

CFLAGS.SunOS+=	-D__EXTENSIONS__

CONFIGURE_ARGS+=	--enable-vala-bindings
# disable ubuntu online accounts, unsure what is needed to enable
CONFIGURE_ARGS+=	--disable-uoa
CONFIGURE_ARGS+=	--with-openldap
CONFIGURE_ARGS+=	--with-libdb=${BDBBASE}

PKGCONFIG_OVERRIDE+=	addressbook/libebook-contacts/libebook-contacts.pc.in
PKGCONFIG_OVERRIDE+=	addressbook/libebook/libebook.pc.in
PKGCONFIG_OVERRIDE+=	addressbook/libedata-book/libedata-book.pc.in
PKGCONFIG_OVERRIDE+=	calendar/libecal/libecal.pc.in
PKGCONFIG_OVERRIDE+=	calendar/libedata-cal/libedata-cal.pc.in
PKGCONFIG_OVERRIDE+=	camel/camel.pc.in
PKGCONFIG_OVERRIDE+=	evolution-data-server.pc.in
PKGCONFIG_OVERRIDE+=	libebackend/libebackend.pc.in
PKGCONFIG_OVERRIDE+=	libedataserver/libedataserver.pc.in
PKGCONFIG_OVERRIDE+=	libedataserverui/libedataserverui.pc.in

BUILDLINK_TRANSFORM+=	l:db:${BDB_TYPE}
BUILDLINK_TRANSFORM+=	rm:-ldl

.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../lang/vala/buildlink3.mk"
.include "../../security/libsecret/buildlink3.mk"
.include "../../wip/gcr/buildlink3.mk"
.include "../../net/gnome-online-accounts/buildlink3.mk"
.include "../../devel/gperf/buildlink3.mk"
.include "../../security/libgnome-keyring/buildlink3.mk"
BUILDLINK_API_DEPENDS.gtk3+=			gtk3+>=3.10
.include "../../x11/gtk3/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../databases/openldap-client/buildlink3.mk"
.include "../../databases/sqlite3/buildlink3.mk"
.include "../../devel/GConf/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
BUILDLINK_API_DEPENDS.glib2+=			glib2>=2.38
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/libglade/buildlink3.mk"
.include "../../wip/libgweather/buildlink3.mk"
.include "../../devel/nspr/buildlink3.mk"
.include "../../devel/nss/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../net/libsoup/buildlink3.mk"
.include "../../net/ORBit2/buildlink3.mk"
.include "../../net/libgdata/buildlink3.mk"
.include "../../security/libgnome-keyring/buildlink3.mk"
.include "../../textproc/gtk-doc/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
BUILDLINK_API_DEPENDS.libical+=			libical>=0.43
.include "../../time/libical/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bdb.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
