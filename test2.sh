#!/bin/bash
WHICH=/usr/bin/which;ECHO=`$WHICH echo`;UNAME=`$WHICH uname`;GREP=`$WHICH grep`;IFCONFIG=/usr/sbin/ifconfig;LINUX_IFCONFIG=/sbin/ifconfig;NWMGR=/usr/sbin/nwmgr;OSNAME=`
$UNAME`;SUCCESS=0;FAILURE=1;exit_code=0;nic_count=0;nic_down="";nic_down_count=0;nic_stat="";nic_up="";echo;if [[ -s $LINUX_IFCONFIG ]]; then nic_count=`$LINUX_IFCONFIG -a | $GREP -v 
"NOARP" | $GREP -c "MTU"`;if [ $nic_count -gt 0 ]; then nic_down_count=`$LINUX_IFCONFIG -a | $GREP -v "NOARP" | $GREP -v "UP" | $GREP -c "MTU"`;if [ $nic_down_count -gt 0 ]; then 
exit_code=$FAILURE $ECHO "WARNING:  One or more NICs are DOWN:";else exit_code=$SUCCESS $ECHO "All NICs are UP:";fi;$LINUX_IFCONFIG -a | $GREP -E 'Link encap|MTU'| $GREP -v "UP"| $GREP -B 1"MTU";else $ECHO "Unable to determine NIC status with ifconfig command.";fi; else $ECHO "The ifconfig command is not found.  Unable to determine NIC status.";fi;echo " ";
