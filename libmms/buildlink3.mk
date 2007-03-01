# $NetBSD: buildlink3.mk,v 1.1.1.1 2007/03/01 06:51:06 netcap Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBMMS_BUILDLINK3_MK:=	${LIBMMS_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libmms
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibmms}
BUILDLINK_PACKAGES+=	libmms
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libmms

.if ${LIBMMS_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libmms+=	libmms>=0.3
BUILDLINK_PKGSRCDIR.libmms?=	../../wip/libmms
BUILDLINK_DEPMETHOD.libmms?=	build
.endif	# LIBMMS_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
