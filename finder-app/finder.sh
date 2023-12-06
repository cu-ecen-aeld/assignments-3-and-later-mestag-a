#!/bin/sh
set -e

usage() {
    cat <<EOF >&2
Usage: $0 filesdir searchstr
EOF
}

errcho() {
    echo "$@" >&2
}

filesdir="$1"
searchstr="$2"

if [ $# -lt 2 ]; then
    usage
    exit 1
elif ! [ -d "$filesdir" ]; then
    errcho "${filesdir} isn't a directory"
    exit 1
fi

x=$(find "$filesdir" -type f | wc -l)
y=$(grep "$searchstr" -R "$filesdir" | wc -l)

echo "The number of files are ${x} and the number of matching lines are ${y}"
