#!/usr/bin/env bash
#?
# run-opendkim.sh - Starts OpenDKIM
#
# USAGE
#
#	run-opendkim.sh
#
# BEHAVIOR
#
#	Starts OpenDKIM.
#
#

# {{{1 Exit on any error
set -e

# {{{1 Run
exec opendkim -f -vvv
