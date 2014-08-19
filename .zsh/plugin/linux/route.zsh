INTERFACES=(
	"eth0"
	"eth1"
	"eth2"
)

for (( i=1; i<=${#INTERFACES[@]}; i=i+1)); do
	ETHxLINK=`sudo mii-tool | grep "${INTERFACES[i]}" | grep "link ok"`	 
	if  [ "$ETHxLINK" != "" ]; then
		ETHxIP=`/sbin/ifconfig ${INTERFACES[i]} | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'`
		ETHxIPp=`echo "$ETHxIP" | cut -d'.' -f-2`
		if [[ "$ETHxIPp" == "10.241" ]]; then
			ROUTEEXIST=`ip route show 10.241.0.0/16 | wc -l`
			if [ $ROUTEEXIST -eq 0 ]; then
				sudo ip route add 10.241.0.0/16 dev ${INTERFACES[i]}
			fi
		fi
	fi
done
