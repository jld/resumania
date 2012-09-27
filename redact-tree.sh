#!/bin/sh
set -e -u
redactions=${0%redact-tree.sh}.redactions

RE=""
while read -r line
do RE=$RE${RE:+|}$line
done < "$redactions"

find . -name \*.ml | while read name
do
    case $name in (*.ml) ;; (*) continue ;; esac
    tmp=${name}~
    mv "$name" "$tmp"
    sed -r "s/$RE/[REDACTED]/g" < "$tmp" > "$name"
    rm "$tmp"
done
rm -f .redactions
