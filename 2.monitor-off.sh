#!/bin/bash
if [ -f wlan.tmp ]
    then
        wlan=$(cat ./wlan.tmp)
        ifconfig $wlan down
        macchanger -p $wlan
        iwconfig $wlan mode managed
        ifconfig $wlan up
        iwconfig $wlan | grep Mode
        rm ./wlan.tmp
    else
        echo "assigned monitor mode wlan not found"
        echo "did you run the initial script first?"
fi