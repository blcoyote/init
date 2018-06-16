#!/bin/bash
ifconfig wlan1 down
iwconfig wlan1 mode monitor
iwconfig wlan1 up
