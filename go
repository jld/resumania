#!/bin/sh
eval '! false' 2>/dev/null || exec ksh "$0" "$@"
for i in "$@"
do i="${i%.ml}"; make "$i".gen && ./"$i".gen
done
