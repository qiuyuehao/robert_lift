#!/bin/sh

echo $1
if [ "start" = $1 ]
then
echo "run4g..."
./run4g &
sleep 20
udhcpc -i wwan0 &
else
echo "stop 4g service"
killall -9 run4g
fi

