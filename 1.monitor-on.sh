#!/bin/bash

#determine wlan adaptors. if more than one, use the last
wlan=iw dev | awk '$1=="Interface"{print $2}' #need verification on multi wlan adaptor system.
echo $wlan > ./wlan.tmp
ifconfig $wlan down
macchanger -r $wlan
iwconfig $wlan mode monitor
ifconfig $wlan up
iwconfig $wlan | grep Mode
