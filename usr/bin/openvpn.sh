#!/bin/sh

echo "go"
ping 8.8.8.8 -q -c 1  -w 5
echo $?
while [ "$?"x != "0"x ];do
	sleep 3
	ping 8.8.8.8 -q -c 1  -w 5
	echo $?
done
echo "connnect to wan now"
echo $wan_ok

ntpdate ntp1.aliyun.com

ntpdate ntp1.aliyun.com

openvpn --cd /etc/openvpn --config /etc/openvpn/client.ovpn >/dev/null 2>&1&

have_tun_route=`route -n | grep 0.0.0.0 | grep tun0 | grep -v 255.255.255`
have_typetwo_route=`route -n | grep 128.0.0.0 | grep tun0`

while [ 1 ];do

	if [ "x$have_tun_route" != x"" ]; then
		route del -net  0.0.0.0 netmask 128.0.0.0 dev tun0
	fi

	if [ "x$have_typetwo_route" != x"" ]; then
		route del -net 128.0.0.0 netmask 128.0.0.0 gw 0.0.0.0
	fi

	sleep 5

	have_tun_route=`route -n | grep 0.0.0.0 | grep tun0 | grep -v 255.255.255`
	have_typetwo_route=`route -n | grep 128.0.0.0 | grep tun0`

done



