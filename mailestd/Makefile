MAILESTD_MT=	#

PROG=		mailestd
SRCS=		bytebuf.c mailestd.c mailestctl.c parse.y parser.c
LINKS=		${BINDIR}/mailestd ${LOCALBASE}/bin/mailestctl
CFLAGS+=	-DHAVE_LIBESTDRAFT -DMONITOR_KQUEUE
LIBESTDRAFTOBJ!=cd ${.CURDIR}/../libestdraft; ${MAKE} _whereobj
LDFLAGS=	-L${LOCALBASE}/lib
LDADD=		-lestraier -levent -lqdbm
DPADD=		${LIBESTRAIER} ${LIBEVENT} ${LIBQDBM}
MAN=		mailestctl.1 mailestd.8 mailestd.conf.5 mew-mailest.1
MLINKS=		mew-mailest.1 cmew-mailest.1
MLINKS+=	mew-mailest.1 smew-mailest.1

.ifdef DEBUG
CFLAGS+=	-DMAILESTD_DEBUG
.endif
.ifdef MAILESTD_MT
CFLAGS+=	-DMAILESTD_MT
LDADD+=		-lpthread
DPADD+=		${LIBPTHREAD}
.endif

beforeinstall:
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
	    ${.CURDIR}/../mew-mailest.sh ${PREFIX}/bin/mew-mailest
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
	    ${.CURDIR}/../cmew-mailest.sh ${PREFIX}/bin/cmew-mailest
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
	    ${.CURDIR}/../smew-mailest.sh ${PREFIX}/bin/smew-mailest

LDFLAGS+=	-L${LIBESTDRAFTOBJ}
LDADD+=		-lestdraft
DPADD+=		${LIBESTDRAFTOBJ}/libestdraft.a

.include <bsd.prog.mk>
