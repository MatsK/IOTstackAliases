#!/bin/bash
ip_eth0=`ip -f inet addr show eth0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p'`
ip_wlan0=`ip -f inet addr show wlan0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p'`
temp=`vcgencmd measure_temp`
up=`uptime -p`
#up=`uptime | awk -F"up " '{print $2}' | awk -F"," '{print $1}'`
used=`df -h | grep 'dev/root' | awk '{print $3}'`
avail=`df -h | grep 'dev/root' | awk '{print $4}'`

clear
echo -e "\033[0;32m
    .~~.   .~~.
   '. \ ' ' / .'\033[0;31m
    .~ .~~~..~.       \033[0;37m Raspberry Pi \033[0;31m
   : .~.'~'.~. :      \033[0;37m ------------ \033[0;31m
  ~ (   ) (   ) ~     \033[0;37m Eth0:  $ip_eth0 \033[0;31m
 ( : '~'.~.'~' : )    \033[0;37m Wlan0: $ip_wlan0 \033[0;31m
  ~ .~ (   ) ~. ~     \033[0;37m $temp \033[0;31m
   (  : '~' :  )      \033[0;37m $up \033[0;31m
    '~ .~~~. ~'       \033[0;37m Used / Available \033[0;31m
        '~'           \033[0;37m $used / $avail \033[0;31m\033[0;30m"


