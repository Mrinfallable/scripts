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

size=$(curl -s http://$h -H "Host: probablynotavhost.$h" | wc -c)

ffuf -u http://$h -w $w -H "Host: FUZZ.$h" -fs $size | tee /home/$USER/htb/$H
