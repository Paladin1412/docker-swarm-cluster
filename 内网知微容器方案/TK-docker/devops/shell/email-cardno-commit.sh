#!/bin/sh
cd $1

startTime="$2"
endTime="$3"

git log $5 --since="${startTime}" --until="${endTime}" --author="$4"  --grep="$6"  --no-merges --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added:%s,removed:%s,total:%s",add,subs,loc }'


#git log   scrum  --no-merges --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added:%s,removed:%s,total:%s",add,subs,loc }'
# added:1671595,removed:1093192,total:578403
#git log   master  --no-merges --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added:%s,removed:%s,total:%s",add,subs,loc }'
#added:434894,removed:321435,total:113459
#git log   --all  --no-merges --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added:%s,removed:%s,total:%s",add,subs,loc }'
#added:1746981,removed:1110436,total:636545


