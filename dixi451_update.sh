#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${NC}
  exit 1
fi

echo -e ${GREEN}"**************************************************************"${NC}
echo -e ${GREEN}"This will Install an Update for DixiCoin to Version 4.5.1"${NC}
echo
echo -e ${GREEN}"If this is a New Install please do Not continue."${NC}
echo -e ${GREEN}"Multiple MN setups will only be stopped and not removed or updated."${NC}
echo -e ${GREEN}"Some additional details provided after update."${NC}
echo -e ${GREEN}"Do You Wish To Update? type y/n followed by [ENTER]:"${NC}
read AGREE


if [[ $AGREE =~ "y" ]] ; then

#Updating Files
echo -e ${GREEN}"Please wait 30 seconds while we attempt to stop the DixiCoin Daemon."${NC}
sudo apt install -y unzip > /dev/null 2>&1
systemctl stop dixicoin > /dev/null 2>&1
sleep 15
sudo killall dixicoind > /dev/null 2>&1
sleep 10
wget https://github.com/Dixicoin-DXC/Dixicoin/releases/download/v4.5.1/DixiCoin-4.5.1-x86_64-pc-linux-gnu.zip
chmod 755 DixiCoin-4.5.1-x86_64-pc-linux-gnu.zip
unzip -o DixiCoin-4.5.1-x86_64-pc-linux-gnu.zip
chmod 755 dixicoind
chmod 755 dixicoin-cli
mv -f dixicoind ./../usr/local/bin
mv -f dixicoin-cli ./../usr/local/bin
mv -f dixicoin-tx ./../usr/local/bin
mv -f DixiCoin-4.5.1-x86_64-pc-linux-gnu.zip dixicoin451.zip
rm -rf dixicoin-qt
systemctl start dixicoin
echo -e ${GREEN}"**************************************************************"${NC}
echo -e ${GREEN}"Your DixiCoin Daemon has been updated."${NC}
echo -e ${GREEN}"Please verify the DixiCoin Daemon is running and version 4.5.1"${NC}
echo -e ${GREEN}"dixicoin-cli getinfo"${NC}
echo -e ${GREEN}"If Failure to connect to server please start Daemon with service start command."${NC}
echo -e ${GREEN}"systemctl start dixicoin"${NC}
echo -e ${GREEN}"If DixiCoin Service not installed you may start with traditional command."${NC}
echo -e ${GREEN}"dixicoind"${NC}
echo -e ${GREEN}"**************************************************************"${NC}
echo -e ${GREEN}"Please allow the daemon to fully sync and run checks."${NC}
echo -e ${GREEN}"dixicoin-cli mnsync status"${NC}
echo -e ${GREEN}"**************************************************************"${NC}
echo -e ${GREEN}"When checks complete you may check masternode status."${NC}
echo -e ${GREEN}"Some Masternodes may continue to be active & avoid unnecessary activation."${NC}
echo -e ${GREEN}"dixicoin-cli masternode status."${NC}
echo -e ${GREEN}"If no longer active you may now start from local wallet."${NC}
echo -e ${GREEN}"**************************************************************"${NC}
echo -e ${RED}"Those running multiple instances of DixiCoin. All Instances have been stopped."${NC}
echo -e ${RED}"Only Masternode 1 has been updated. Please manually replace the daemon and cli for additional MN's"${NC}
echo -e ${RED}"unzip dixicoin451.zip which has been left available in your root directory"${NC}
echo -e ${RED}"and copy the dixicoind and dixicoin-cli into each respective directory after removing the previsous daemon and cli"${NC}
echo -e ${GREEN}"**************************************************************"${NC}
echo -e ${GREEN}"Please keep in mind not all setups are prepared the same & may require adjustments. If you experience issues please"${NC}
echo -e ${GREEN}"keep calm & seek community assistance. Many issues can be resolved with a few commands."${NC}
echo -e ${GREEN}"Brought to you by LordSoylent#7520 & the DixiCoin Community"${NC}
fi
