# kankun-rebooter
A simple IP check to reboot the Kankun plug.

## Pre Requisites

In order for you to use this script, you need to have the following items:

1. (optional) An IFTTT account and a Maker key. [Link](http://www.makeuseof.com/tag/ifttt-connect-anything-maker-channel/) [Link] (https://ifttt.com/maker)
2. A Kankun plug already setup and connected to your network. [Link] (http://www.anites.com/2015/01/hacking-kankun-smart-wifi-plug.html)
3. A static IP associated to the Kankun plug WiFi. 
4. Some knowledge in basic Unix commands.
5. The CGI script. [Link] (http://www.anites.com/2015/01/hacking-kankun-smart-wifi-plug.html)
6. Your internet connections static IP.

## Setup Instructions

1. Login as root to your Kankun plug.
2. Get the script and put it in root home directory (/root).
3. Edit and configure the necessary values.
4. Setup an cronjob (ie 15 minute interval checks `*/15 * * * * /root/reboot.sh >/dev/null 2>&1`).
5. (optional) Comment out the `wget` for the Maker IFTTT endpoint if you dont want to use it. 

## What This Script Does

Its quite simple. It cross references the provided IP with the current external IP fetched from ipecho.net and if it matches, it does nothing. If you get a different IP or cant get an IP (I assume it falls back to the `else` condition if theres no connection), it will initiate a reboot via the CGI script. 

Since the Kankun plug has limited storage space, I included the IFTTT option to further expand the capabilities of logging. The simple recipe I have is that when it reboots, it pushes a notification on my phone and logs it to a Google Spreadsheet so I could track the frequency of the connection going down.

You are not forced to use the IFTTT Maker feature, you may comment it out if you just want a simple reboot process. 

## Todo

1. Test if localhost would work. This saves the trouble of allocating a static IP for the Kankun plug.
2. Put out the configurable stuff as variables. 
3. Validate and test if indeed no connection would end up in the else section. 
