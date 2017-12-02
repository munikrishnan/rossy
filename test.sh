NETWORK=`ifconfig -a | awk '{print $0}' | grep -i up` | grep -oP "\bUP.*?\b" ; if [ $NETWORK -eq UP ];then echo "all network card is up and running fine" else; echo "some network card is down";fi;
