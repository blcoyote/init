#!/bin/bash

#determine wlan adaptors. if more than one, use the last
wlan=$(iw dev | awk '$1=="Interface"{print $2}') #need verification on multi wlan adaptor system.
if [ -n wlan ]
    then
        echo "Wireless interface found: $wlan"
        IFS=$'\n' read -d '' -r -a adaptors < $wlan
        echo $adaptors[0] > ./wlan.tmp
        echo "bringing $adaptors[0] down"
        ifconfig $adaptors[0] down
        echo "spoofing mac"
        macchanger -r $adaptors[0]
        echo "done. Enabling monitor mode"
        iwconfig $adaptors[0] mode monitor
        ifconfig $adaptors[0] up
        echo "======================================"
        echo "Wireless interface put in monitor mode"
        iwconfig $adaptors[0] | grep Mode
        echo "======================================"
    else
        echo "==================================="
        echo "ERROR: Wireless interface not found"
        echo "==================================="
fi