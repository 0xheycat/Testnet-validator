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
echo "export OKP4D_CHAIN_ID=okp4-nemeton" >> $HOME/.bash_profile
source $HOME/.bash_profile

echo '================================================='
echo -e "Your node name: \e[1m\e[32m$NODENAME\e[0m"
echo -e "Your wallet name: \e[1m\e[32m$WALLET\e[0m"
echo -e "Your chain name: \e[1m\e[32m$OKP4D_CHAIN_ID\e[0m"
echo '================================================='
sleep 2

printCyan "1. Updating packages..." && sleep 1
# update
sudo apt update && sudo apt upgrade -y

printCyan "2. Installing dependencies..." && sleep 1
sudo apt install -y make gcc jq curl git lz4 build-essential chrony unzip

printCyan "3. Installing go..." && sleep 1
if [ ! -f "/usr/local/go/bin/go" ]; then
  source <(curl -s "https://raw.githubusercontent.com/fatalbar/Testnet-validator/main/Packages/go_install.sh")
  source .bash_profile
fi

echo "$(go version)"

printCyan "4. Install binaries..." && sleep 1

cd || return
rm -rf okp4d
git clone https://github.com/okp4/okp4d.git
cd okp4d || return
git checkout v2.2.0
make install
okp4d version # v2.2.0

okp4d config keyring-backend test
okp4d config chain-id $OKP4D_CHAIN_ID
okp4d init $NODENAME --chain-id $OKP4D_CHAIN_ID

curl https://raw.githubusercontent.com/okp4/networks/main/chains/nemeton/genesis.json > $HOME/.okp4d/config/genesis.json
sha256sum $HOME/.okp4d/config/genesis.json #c2e8fff161850e419e1cb1bef3648c0ed0db961b7713151f10f2509e3fc2ff40

printCyan "5. Setting seeds and peers binaries..." && sleep 1
curl -s https://snapshots2-testnet.nodejumper.io/okp4-testnet/addrbook.json > $HOME/.okp4d/config/addrbook.json

sed -i 's|^minimum-gas-prices *=.*|minimum-gas-prices = "0.0001uknow"|g' $HOME/.okp4d/config/app.toml
seeds="8e1590558d8fede2f8c9405b7ef550ff455ce842@51.79.30.9:26656,bfffaf3b2c38292bd0aa2a3efe59f210f49b5793@51.91.208.71:26656,106c6974096ca8224f20a85396155979dbd2fb09@198.244.141.176:26656,a7f1dcf7441761b0e0e1f8c6fdc79d3904c22c01@38.242.150.63:36656"
peers="994c9398e55947b2f1f45f33fbdbffcbcad655db@okp4-testnet.nodejumper.io:29656"
sed -i -e 's|^seeds *=.*|seeds = "'$seeds'"|; s|^persistent_peers *=.*|persistent_peers = "'$peers'"|' $HOME/.okp4d/config/config.toml

printCyan "6. Setting pruning..." && sleep 1

sed -i 's|pruning = "default"|pruning = "custom"|g' $HOME/.okp4d/config/app.toml
sed -i 's|pruning-keep-recent = "0"|pruning-keep-recent = "100"|g' $HOME/.okp4d/config/app.toml
sed -i 's|pruning-interval = "0"|pruning-interval = "10"|g' $HOME/.okp4d/config/app.toml

printCyan "7. creating service..." && sleep 1

sudo tee /etc/systemd/system/okp4d.service > /dev/null << EOF
[Unit]
Description=OKP4 Node
After=network-online.target
[Service]
User=$USER
ExecStart=$(which okp4d) start
Restart=on-failure
RestartSec=10
LimitNOFILE=10000
[Install]
WantedBy=multi-user.target
EOF

okp4d tendermint unsafe-reset-all --home $HOME/.okp4d --keep-addr-book

cd "$HOME/.okp4d" || return
rm -rf data
rm -rf wasm

SNAP_NAME=$(curl -s https://snapshots2-testnet.nodejumper.io/okp4-testnet/ | egrep -o ">okp4-nemeton.*\.tar.lz4" | tr -d ">")
curl https://snapshots2-testnet.nodejumper.io/okp4-testnet/${SNAP_NAME} | lz4 -dc - | tar -xf - -C $HOME/.okp4d

sudo systemctl daemon-reload
sudo systemctl enable okp4d
sudo systemctl restart okp4d

printLine
echo -e "Check logs:            ${CYAN}sudo journalctl -u $BINARY -f --no-hostname -o cat ${NC}"
echo -e "Check synchronization: ${CYAN}$BINARY status 2>&1 | jq .SyncInfo.catching_up${NC}"
