#!/usr/bin/env bash
#?
# run-postfix.sh - Starts Postfix
#
# USAGE
#
#	run-postfix.sh
#
# BEHAVIOR
#
#	Starts Postfix.
#
#?

# {{{1 Exit on any error
set -e

# {{{1 Check configuration
if ! postfix check; then
	echo "Error: Failed to check Postfix configuration" >&2
	exit 1
fi

# {{{1 Run
exec /usr/libexec/postfix/master -d
