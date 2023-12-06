#!/bin/sh
set -e

usage() {
    cat <<EOF >&2
Usage: $0 file str
EOF
}

errcho() {
    echo "$@" >&2
}

file="$1"
str="$2"

if [ $# -lt 2 ]; then
    usage
    exit 1
fi

mkdir -p $(dirname "$file") || exit 1
echo "$str" > "$file" || exit 1
