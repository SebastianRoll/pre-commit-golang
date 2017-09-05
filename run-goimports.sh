#!/usr/bin/env bash

# Redirect output to stderr.
exec 1>&2

# list staged go files
# ignore trees starting with "_", like the go tool
lsgo() {
	git ls-files|egrep '.*[.]go$'|fgrep -v /_
}

# get the contents of $1 from the staging area
# (the staging area is the stuff that will be committed)
catstaged() {
	git cat-file -p :$1
}

check() {
	if test -n "`goimports -d <(catstaged $1)`"
	then echo error: goimports $1 && return 1
	fi
}

ok=true
for file in `lsgo`
do check $file || ok=false
done
test $ok = true