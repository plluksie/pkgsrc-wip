# $NetBSD: buildlink3.mk,v 1.2 2005/11/28 13:52:43 ghen Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
JDK15_BUILDLINK3_MK:=		${JDK15_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=		jdk15
.endif

BUILDLINK_PACKAGES:=		${BUILDLINK_PACKAGES:Njdk15}
BUILDLINK_PACKAGES+=		jdk15

.if !empty(JDK15_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.jdk15+=	jdk15>=1.5.0.2
BUILDLINK_PKGSRCDIR.jdk15?=	../../wip/jdk15
BUILDLINK_JAVA_PREFIX.jdk15=	${PREFIX}/java/jdk-1.5.0

BUILDLINK_PASSTHRU_DIRS+=	${BUILDLINK_JAVA_PREFIX.jdk15}

BUILDLINK_CPPFLAGS.jdk15= \
	-I${BUILDLINK_JAVA_PREFIX.jdk15}/include				\
	-I${BUILDLINK_JAVA_PREFIX.jdk15}/include/netbsd
.endif	# JDK15_BUILDLINK3_MK

.include "../../mk/x11.buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
