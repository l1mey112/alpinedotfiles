#!/bin/bash
# shell script to prepend i3status with compass-status

pkill -f compass-status

cache=`mktemp`
compass-status run > $cache &

while :
do
  read line
  compass=`tail -n1 $cache`
  #compass_json="\"name\":\"classes\",\"color\":\"#FFFFFF\", \"full_text\":\"$compass\"},{"

  compass_json='"name":"classes","color":"#FFFFFF", "full_text":"'
  compass_json+=`printf "$compass"`
  compass_json+='"},{'

  line=${line/[{/[{$compass_json}
  echo "$line" || exit 1
done
