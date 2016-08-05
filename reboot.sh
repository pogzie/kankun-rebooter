#!/bin/ash
# Title: Kankun Plug Rebooter Script
# Author: Allan Paul Sy Ortile
# Date: 2016-07-13
# Version: 0.02 (2016-08-05)
#
# Put this as a cronjob via crontab -e
# This will check every 15 minutes if the IP is the same, if not it will reboot the device
# 	*/15 * * * * /root/reboot.sh >/dev/null 2>&1
#
# Things to change according to your configuration:
#	<DSL_IP> - This should contain the static IP of your connection. 
#	<KANKUN_IP> - This is the IP address of your Kankun device which has the relay.cgi script.
#	<IFTTT_KEY> - Your Maker IFTTT channel key.
#


# date

DSL_IP="<DSL_IP>"
PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`

echo This is your public IP: $PUBLIC_IP

# This hardcodes the public IP. USE ONLY FOR TESTING.
#PUBLIC_IP="127.0.0.1"
#echo TESTING TESTING TESTING

if [[ $DSL_IP  == $PUBLIC_IP ]];  then
	echo "Still the same, doing nothing."
else
	echo "Invoking flip switch."
	# INSERT TOGGLE OFF HERE
	wget http://<KANKUN_IP>/cgi-bin/relay.cgi?off -O - -q
	sleep 10
	# INSERT TOGGLE ON HERE
	wget http://<KANKUN_IP>/cgi-bin/relay.cgi?on -O - -q
	wget http://maker.ifttt.com/trigger/reboot_triggered/with/key/<IFTTT_KEY>> -O - -q
	echo "Done."
fi

