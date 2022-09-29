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

sleep 2

# set vars
if [ ! $NODENAME ]; then
	read -p "Validator Name: " NODENAME
	echo 'export NODENAME='$NODENAME >> $HOME/.bash_profile
fi
if [ ! $WALLET ]; then
	echo "export WALLET=wallet" >> $HOME/.bash_profile
fi
echo "export MUN_CHAIN_ID=testmun" >> $HOME/.bash_profile
source $HOME/.bash_profile

echo '================================================='
echo -e "Your node name: \e[1m\e[32m$NODENAME\e[0m"
echo -e "Your wallet name: \e[1m\e[32m$WALLET\e[0m"
echo -e "Your chain name: \e[1m\e[32m$MUN_CHAIN_ID\e[0m"
echo '================================================='
sleep 2

echo -e "\e[1m\e[32m1. Updating packages... \e[0m" && sleep 1
# update
sudo apt update && sudo apt upgrade -y

echo -e "\e[1m\e[32m2. Installing dependencies... \e[0m" && sleep 1
# packages
sudo apt install build-essential jq -y

# install go
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash -s -- --version 1.18
source ~/.profile

echo -e "\e[1m\e[32m3. Downloading and building binaries... \e[0m" && sleep 1
# download binary
cd $HOME
git clone https://github.com/munblockchain/mun && cd mun
sudo rm -rf ~/.mun
go mod tidy
make install

mkdir -p ~/.mun/upgrade_manager/upgrades
mkdir -p ~/.mun/upgrade_manager/genesis/bin

#Fetch genesis
curl --tlsv1 https://node1.mun.money/genesis? | jq ".result.genesis" > ~/.mun/config/genesis.json

# init
mund init $NODENAME --chain-id testmun && \
mund config chain-id testmun

# genesys update
cp $(which mund) ~/.mun/upgrade_manager/genesis/bin
sudo cp $(which mund-manager) /usr/bin

# seed & pers
seeds="b4eeaf7ca17e5186b181885714cedc6a78d20c9b@167.99.6.48:26656"
sed -i 's/stake/utmun/g' ~/.mun/config/genesis.json
peers="e511f0d193f9e6b52e3bbd2491073e2a8f01aa7b@198.244.202.98:26656"
sed -i 's|^persistent_peers *=.*|persistent_peers = "'$peers'"|' $HOME/.mun/config/config.toml

# create service
sudo tee /etc/systemd/system/mund.service > /dev/null << EOF
[Unit]
Description=mund
Requires=network-online.target
After=network-online.target

[Service]
User=root
Group=root
Restart=on-failure
RestartSec=3
Environment=DAEMON_NAME=mund
Environment=DAEMON_HOME=/$HOME/.mun
Environment=DAEMON_ALLOW_DOWNLOAD_BINARIES=on
Environment=DAEMON_RESTART_AFTER_UPGRADE=on
PermissionsStartOnly=true
ExecStart=/usr/bin/mund-manager start --pruning="nothing" --rpc.laddr "tcp://0.0.0.0:26657" --home $HOME/.mun
StandardOutput=file:/var/log/mund/mund.log
StandardError=file:/var/log/mund/mund_error.log
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

# start service
sudo systemctl daemon-reload
sudo systemctl enable mund
sudo systemctl restart mund

echo '=============== SETUP FINISHED ==================='
