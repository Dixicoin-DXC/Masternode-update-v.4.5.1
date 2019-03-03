Dixicoin

Compile for Ubuntu 16.0.4

Intended for updating a current single install of DixiCoin to v4.5.1
Update Script will not update Ubuntu 16.0.4
Update Script will not Install dependencies
Update Script will stop all instances of DixiCoin
Update Script will Update Primary MN Daemon and cli only
Instructions:
1. wget url-to-dixi451_update.sh (Located on the Dixicoin GitHub Release page)
2. chmod +x dixi451_update.sh (changes permissions so the script may be executed)
3. bash dixi451_update.sh (runs the install script)

Upon completion the dixicoin service will be restarted, if the service was not installed 
you may be required to start the daemon with the traditional command: dixicoind

Please establish that DixiCoin is running, updated and sync checks complete:
dixicoin-cli getinfo
dixicoin-cli mnsync status

When the mnsync status is verified complete, check the masternode status prior to 
additional activation to avoid unnecessary activation wait time:
dixicoin-cli masternode status
If masternode status is active you are done.
If masternode inactive you may activate from PC wallet.

Other useful commands of operation:
systemctl start dixicoin.service
systemctl stop dixicoin.service
systemctl status dixicoin.service
systemctl enable dixicoin.service
systemctl disable dixicoin.service
dixicoind (manual start daemon without service)
dixicoin-cli getinfo
dixicoin-cli mnsync status
dixicoin-cli masternode status
dixicoin-cli stop (manual daemon stop without the service)

****************
For those running additional MN's
The dixi451.zip is avail in your root directory if needed.
unzip dixi451.zip and the needed files will unpack.
Remove the old daemon and cli in each respective directory for each additional MN and copy
the new in its place. Start your additional MN's with the required data paths.
Example commands:
ls (view inside directory)
cd dixi2 (move into dixi2 dir)
rm dixicoind (remove dixicoind)
rm dixicoin-cli (remove dixicoin-cli)
cp ~/dixicoind ~/dixi2/dixicoind (copy dixicoin daemon to dixi2)
cp ~/dixicoin-cli ~/dixi2/dixicoin-cli (copy client to dixi2)
./dixicoind -datadir=/root/dixi2 (starts dixi2 mn)
Repeat for additional MN's and adapt to your needs. These are basic commands and Instructions.

** If possible Please stop all additional instances of DixiCoin prior to running the update script 
as to avoid unwanted blockchain corruption & undesired re-sync times.

Thank You, Brought to you by LordSoylent#7520