!#/bin/sh

base=/data/common

for fd in api card-read card-write devops filter history kafka kanban multi mysql nginx notification nstats nysync query rbac redis schema view zookeeper

do
  
  cd ${base}/${fd}
  
  docker build -t zhiwei-${fd}:0.1 .


done


echo 'finish the job'


  
   