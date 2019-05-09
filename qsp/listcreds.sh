#!/bin/bash


for ip in `find credentials -type d -mindepth 1 |cut -f2 -d/`; do 
  host=`grep -1 $ip inventory|head -1|cut -f2 -d[|cut -f1 -d]`
  echo
  echo $host $ip 
  for file in `find credentials/$ip -type f -mindepth 1`; do 
    echo -n "    - "
    echo $file|awk -F/ '{print $NF;}'
	echo -n "      "
	cat $file
  done
done


