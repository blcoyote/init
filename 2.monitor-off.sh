#!/bin/bash
ifconfig wlan1 down
macchanger -r wlan1
iwconfig wlan1 mode managed
ifconfig wlan1 up
iwconfig wlan1 | grep Mode