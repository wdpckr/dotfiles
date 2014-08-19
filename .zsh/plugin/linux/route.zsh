
for (( i=2; i<=`sudo mii-tool | wc -l`; i=i+1)); do
	IF=`sudo mii-tool | awk NR==$i'{print $1}' | cut -d':' -f-1`
	ETHxLINK=`sudo mii-tool | grep "${IF}" | grep "link ok"`	 
	if  [ "$ETHxLINK" != "" ]; then
		ETHxIP=`/sbin/ifconfig ${IF} | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'`
		ETHxIPp=`echo "$ETHxIP" | cut -d'.' -f-2`
		ROUTEEXIST=`ip route show ${ETHxIPp}.0.0/16 | wc -l`
		if [ $ROUTEEXIST -eq 0 ]; then
			sudo ip route add ${ETHxIPp}.0.0/16 dev ${IF}
		fi
	fi
done
