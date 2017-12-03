#!/bin/sh

#sleep 1
insmod ./8188eu.ko
./webService &
sleep 2
./sensorMonitor.exe &
./watchDog &


