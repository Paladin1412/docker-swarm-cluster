#!/bin/sh
cd $1
git show $2 --pretty=tformat:%H --numstat |grep -v $2 | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added:%s, removed:%s ,total:%s\n",add,subs,loc }'

