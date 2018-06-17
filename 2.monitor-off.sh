#!/bin/bash
wlan=$(cat ./wlan.tmp)
ifconfig $wlan down
macchanger -r $wlan
iwconfig $wlan mode managed
ifconfig $wlan up
iwconfig $wlan | grep Mode
rm ./wlan.tmp
