#!/bin/bash
echo "================================================================================"
echo -e "\033[0;35m"
echo " ' ███╗░░░███╗███████╗░█████╗░░██╗░░░░░░░██╗██████╗░░█████╗░██████╗░███████╗██████╗░ ";
echo " ' ████╗░████║██╔════╝██╔══██╗░██║░░██╗░░██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗ ";
echo " ' ██╔████╔██║█████╗░░██║░░██║░╚██╗████╗██╔╝██████╦╝██║░░██║██████╔╝█████╗░░██║░░██║ ";
echo " ' ██║╚██╔╝██║██╔══╝░░██║░░██║░░████╔═████║░██╔══██╗██║░░██║██╔══██╗██╔══╝░░██║░░██║ ";
echo " ' ██║░╚═╝░██║███████╗╚█████╔╝░░╚██╔╝░╚██╔╝░██████╦╝╚█████╔╝██║░░██║███████╗██████╔╝ ";
echo " ' ╚═╝░░░░░╚═╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝░░╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═════╝░ ";
echo -e "\e[0m"
echo "================================================================================="

sleep 1

# set vars
if [ ! $IP_SERVER ]; then
read -p "Input Your IP: " IP_SERVER
echo 'export IP_SERVER='\"${IP_SERVER}\" >> $HOME/.bash_profile
read -p "Input Your Password: " PASSWORD
echo 'export PASSWORD='\"${PASSWORD}\" >> $HOME/.bash_profile
fi
echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
. $HOME/.bash_profile

echo -e "Your IP Server: \e[1m\e[32m${IP_SERVER}\e[0m"
echo -e "Your Password : \e[1m\e[32m${PASSWORD}\e[0m"
echo '================================================='
sleep 1

echo -e "\e[1m\e[32m1. backup wallet... \e[0m" && sleep 1

# backup wallet
mkdir massa_backup
echo $HOME /massa/massa-node/config/node_privkey.key
echo $HOME /massa/massa-client/wallet.dat
cp $HOME/massa/massa-node/config/node_privkey.key $HOME/massa_backup/node_privkey.key
cp $HOME/massa/massa-client/wallet.dat $HOME/massa_backup/wallet.dat

# delete old folder
rm -rf massa
rm -rf massa.sh
rm -rf massa-testnet.sh
rm -rf massa_TEST.19.3_release_linux.tar.gz

echo -e "\e[1m\e[32m2. upgrade latest massa binary... \e[0m" && sleep 1
# downloading binary and extracting
cd $HOME
wget https://github.com/massalabs/massa/releases/download/TEST.20.0/massa_TEST.20.0_release_linux.tar.gz
tar xvzf massa_TEST.20.0_release_linux.tar.gz

echo -e "\e[1m\e[32m3. Restoring Wallet & setting config... \e[0m" && sleep 1
#restoring wallet
cp $HOME/massa_backup/node_privkey.key $HOME/massa/massa-node/config/
cp $HOME/massa_backup/wallet.dat $HOME/massa/massa-client/

# Update config
cd $HOME
cd massa/massa-node/config && rm -rf config.toml
wget https://raw.githubusercontent.com/fatalbar/Testnet-validator/main/massa/config.toml
sed -i -e "s/^routable_ip *=.*/routable_ip = \"$IP_SERVER\"/" $HOME/massa/massa-node/config/config.toml

sudo tee /root/massa/massa-node/run.sh > /dev/null <<EOF
#!/bin/bash
cd ~/massa/massa-node/
./massa-node -p $PASSWORD |& tee logs.txt
EOF

sudo tee /etc/systemd/system/massad.service > /dev/null <<EOF
[Unit]
Description=Massa Node
After=network-online.target
[Service]
Environment="RUST_BACKTRACE=full"
User=$USER
ExecStart=/root/massa/massa-node/run.sh
Restart=always
RestartSec=3
[Install]
WantedBy=multi-user.target
EOF

chmod +x /root/massa/massa-node/run.sh
systemctl daemon-reload 
systemctl enable massad 
systemctl restart massad

#!/bin/bash
if [ ! $PASSWORD ]; then
read -p "Input Your Password Client: " PASSWORD
echo 'export PASSWORD='\"${PASSWORD}\" >> $HOME/.bash_profile
fi
echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
. $HOME/.bash_profile

echo -e "Input Your Password Client: \e[1m\e[32m${PASSWORD}\e[0m"
echo '================================================='
# Generate New Wallet 

chmod +x $HOME/massa/massa-client/massa-client
cd $HOME/massa/massa-client && wallet_pss=$(./massa-client -p $PASSWORD | grep Address )

echo '=============== UPDATE MASSA 20.0 FINISHED ==================='
echo -e 'To check logs: \e[1m\e[32msudo tail -f /root/massa/massa-node/logs.txt\e[0m'
