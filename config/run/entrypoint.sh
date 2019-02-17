#!/usr/bin/env bash
#?
# entrypoint.sh - Starts mail services
#
# USAGE
#
#	entrypoint.sh
#
# BEHAVIOR
#
#	Starts Postfix and OpenDKIM.
#
#?

# {{{1 Exit on any error
set -e

# {{{1 Configuration
pids=()

# {{{1 Postfix
run-postfix.sh &
pids+=("$!")

if [[ "$?" != "0" ]]; then
	echo "Error: Failed to run Postfix" >&2
	exit 1
fi

# {{{1 OpenDKIM
run-opendkim.sh &
pids+=("$!")

if [[ "$?" != "0" ]]; then
	echo "Error: Failed to run OpenDKIM" >&2
	exit 1
fi

# {{{1 Wait finish
for pid in ${pids[*]}; do
	wait "$pid"
done
