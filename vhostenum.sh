#!/bin/bash
w=$VHS
h=$(tail -n 1 /etc/hosts | cut -d " " -f 2)
while getopts ":h:w:" opt; do
  case $opt in
    h) h="$OPTARG"
    ;;
    w) w="$OPTARG"
    ;;
  esac
done


#usage: ./

size=$(curl -s http://$1 -H "Host: probablynotavhost.$1" | wc -c)

ffuf -u http://$1 -w $w -H "Host: FUZZ.$1" -fs $size
