#!/bin/bash
ifconfig wlan1 down
iwconfig wlan1 mode managed
iwconfig wlan1 up
