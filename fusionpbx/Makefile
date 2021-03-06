# $NetBSD$

DISTNAME=	fusionpbx-4.2.2
PKGNAME=	${DISTNAME}
CATEGORIES=	comms net audio
GITHUB_PROJECT=	fusionpbx
MASTER_SITES=	${MASTER_SITE_GITHUB:=fusionpbx/}
EXTRACT_SUFX=     .zip


MAINTAINER=	kethzer.dr@gmail.com
HOMEPAGE=	${MASTER_SITE_GITHUB:=fusionpbx/fusionpbx/}
COMMENT=	A full-featured multi-tenant GUI for FreeSwitch
LICENSE=	BSD


WRKSRC=			${WRKDIR}
NO_CONFIGURE=		yes
NO_BUILD=		yes
USE_TOOLS+=		pax
INSTALLATION_DIRS=	share/fusionpbx

FUSIONPBX_USER?=         fusionpbx
FUSIONPBX_GROUP?=        fusionpbx
PKG_GROUPS=             ${FUSIONPBX_GROUP}
PKG_USERS=              ${FUSIONPBX_USER}:${FUSIONPBX_GROUP}
PKG_GECOS.${FUSIONPBX_USER}=     FusionPBX
PKG_GROUPS_VARS=        FUSIONPBX_GROUP
PKG_USERS_VARS=         FUSIONPBX_USER


PKG_SYSCONFSUBDIR=      fusionpbx
PKG_SYSCONFDIR_PERMS=   ${FUSIONPBX_USER} ${FUSIONPBX_GROUP} 0755

USE_PHP=        dom filter ftp json pcre pdo pdo_pgsql posix \
                session simplexml xml xmlreader xmlwriter xmlrpc \
                xsl zlib odbc

DEPENDS+=	${PHP_PKG_PREFIX}-pdo_pgsql-[0-9]*:../../databases/php-pdo_pgsql
#DEPENDS+=	${PHP_PKG_PREFIX}-pdo_pgsql>=${PHP_BASE_VERS}:../../databases/php-pdo_pgsql
DEPENDS+=	${PHP_PKG_PREFIX}-pdo_sqlite-[0-9]*:../../databases/php-pdo_sqlite
DEPENDS+=	${PHP_PKG_PREFIX}-memcache-[0-9]*:../../devel/php-memcache
DEPENDS+=	${PHP_PKG_PREFIX}-imap>4.3.3:../../mail/php-imap
DEPENDS+=	${PHP_PKG_PREFIX}-mcrypt-[0-9]*:../../security/php-mcrypt
DEPENDS+=	${PHP_PKG_PREFIX}-json-[0-9]*:../../textproc/php-json
DEPENDS+=	${PHP_PKG_PREFIX}-curl-[0-9]*:../../www/php-curl

do-install:
	cd ${WRKSRC}/${PKGNAME} && pax -rw -pe . ${DESTDIR}${PREFIX}/${INSTALLATION_DIRS}

.include "../../mk/pgsql.buildlink3.mk"
.include "../../databases/php-pdo/buildlink3.mk"
.include "../../lang/php/common.mk"
.include "../../devel/libmemcached/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
