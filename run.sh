#!/usr/bin/env bash
#?
# run.sh - Runs the email container
#
# USAGE
#
#	run.sh [OPTIONS]
#
# OPTIONS
#
#	-t DOCKER_TAG           Tag of Docker container to run
#	-k OPENDKIM_KEYS_DIR    OpenDKIM keys directory on host OS
#	-h                      Show help text
#
# BEHAVIOR
#
#	Runs the email container. Makes sure to mount appropriate volumes.
#
#?

# {{{1 Exit on any error
set -e

# {{{1 Helpers
function print_help(){
	echo "run.sh [-t DOCKER_TAG] [-k OPENDKIM_KEYS_DIR] [-h]"
}

# {{{1 Arguments
# {{{2 Get provided values
while getopts "ht:k:" opt; do
	case "$opt" in
		t)
			docker_tag="$OPTARG"
			;;

		k)
			opendkim_keys_dir="$OPTARG"
			;;

		h)
			print_help
			exit 1
			;;

		'?')
			print_help
			exit 1
			;;
	esac
done

# {{{2 Set default values
if [ -z "$docker_tag" ]; then
	docker_tag="noahhuppert/email:latest"
fi

if [ -z "$opendkim_keys_dir" ]; then
	opendkim_keys_dir="/etc/opendkim/keys"
fi

# {{{1 Run
if ! docker run \
	-it \
	--rm \
	-v "$opendkim_keys_dir":/etc/opendkim/keys \
	"$docker_tag"; then
	echo "Error: Failed to run email docker container" >&2
	exit 1
fi
