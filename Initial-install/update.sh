#!/bin/bash
#wordclock update python files script
echo "deleting old files if existent"
cd /home/pi/wordclock
if [ -d wordclockFiles]; then
	sudo rm -r wordclockFiles
fi
mkdir -m 777 /home/pi/wordclockFiles
echo "Updating python files from github..."
echo "downloading new files..."
cd
cd /home/pi/wordclock/wordclockFiles
sudo curl -o changeToWifi.sh https://raw.githubusercontent.com/S-A-M-J/big-wordclock-firmware/main/Update/changeToWifi.sh
sudo curl -o changeToAp.sh https://raw.githubusercontent.com/S-A-M-J/big-wordclock-firmware/main/Update/changeToAp.sh
sudo curl -o wordclock.py https://raw.githubusercontent.com/S-A-M-J/big-wordclock-firmware/main/Update/wordclock.py" 
cd
echo "downloading flow file..."
cd /home/pi/.node-red
sudo rm flows.json
cd
sudo bash -c "curl -o flows.json https://raw.githubusercontent.com/S-A-M-J/big-wordclock-firmware/main/Update/flows.json" 

sudo touch flows.json
sudo mv flows.json /home/pi/.node-red/flows.json
cd 

node-red-restart


