#!/bin/sh

route del gw 192.168.1.0
killall -9 wpa_supplicant
wpa_supplicant -iwlan0 -c /etc/wpa_supplicant.conf -B &
sleep 3
udhcpc -i wlan0 &

