w=$MED
h=$(tail -n 1 /etc/hosts | cut -d " " -f 2)
o=".html,.php,.txt"
while getopts ":h:w:o" opt; do
  case $opt in
    h) h="$OPTARG"
    ;;
    w) w="$OPTARG"
    ;;
    o) o="$OPTARG"
    ;;
  esac
done

ffuf -s -u http://$h/FUZZ -w $w -e $o | tee /home/twue-wuv/htb/$H/dirscan.txt 
