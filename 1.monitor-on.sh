#!/bin/bash

#determine wlan adaptors. if more than one, use the last
wlan=$(iw dev | awk '$1=="Interface"{print $2}') #need verification on multi wlan adaptor system.
if [ -n wlan ]
    then
        echo "Wireless interface found: $wlan"
        readarray a < $wlan
        echo $a > ./wlan.tmp
        echo "bringing $wlan down"
        ifconfig $wlan down
        echo "spoofing mac"
        macchanger -r $wlan
        echo "done. Enabling monitor mode"
        iwconfig $wlan mode monitor
        ifconfig $wlan up
        echo "======================================"
        echo "Wireless interface put in monitor mode"
        iwconfig $wlan | grep Mode
        echo "======================================"
    else
        echo "==================================="
        echo "ERROR: Wireless interface not found"
        echo "==================================="
fi