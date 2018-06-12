#! /bin/bash
ifconfig wlan1 down
macchanger -r wlan1
iwconfig wlan1 mode monitor
ifconfig wlan1 up
iwconfig wlan1 | grep Mode
#airmon-ng start wlan1mon
