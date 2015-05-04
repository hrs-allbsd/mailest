#!/bin/sh
#
# wrapper script for mew
#
MAILESTCTL=${MAILESTCTL:-mailestctl}

if [ "$1" = "search" ]; then
	shift
	eval set -- \
	    $(while [ $# -gt 2 ]; do echo "\"$1\""; shift; done; echo "\"$2\"")
	exec $MAILESTCTL csearch "$@"
else
	while getopts "+s:b:" ch $@; do :; done
	if [ $(expr $# - $OPTIND) -eq 0 ]; then
		eval set -- \
		    $(while [ $# -gt 1 ]; do echo "$1"; shift; done; \
			echo "update \"$1\"")
	else
		eval set -- "$@" update
	fi
	exec $MAILESTCTL "$@"
fi
