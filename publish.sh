#!/bin/sh
set -e -u
SRC=r2017
DST=jld
set -x
git branch -D redacted || true
git branch redacted master
git filter-branch --force --tree-filter "$(pwd)/redact-tree.sh" redacted
git checkout redacted
./go "$SRC"
git add --force "$DST".*
git commit -m "Commit build products for publication"
git checkout master # FIXME
