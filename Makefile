# New ports collection makefile for:	jail2
# Date created:	   21 October 2012
# Whom:		   Yamagi Burmeister <yamagi@yamagi.org>
#
# $FreeBSD$
#

PORTNAME=	jail2
PORTVERSION=	1.0
CATEGORIES=	sysutils
MASTER_SITES=	#
DISTFILES=	#

MAINTAINER=	yamagi@yamagi.org
COMMENT=	Jail startup/shutdown script with jail.conf support

NO_BUILD=	yes
NO_INSTALL=	yes

USE_RC_SUBR=	jail2

PORTDOCS=	*

.include <bsd.port.mk>
