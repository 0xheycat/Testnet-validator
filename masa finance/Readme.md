
![masafi](https://user-images.githubusercontent.com/81378817/203053328-c1097323-d6b8-404b-86ef-3c2bcb7798a1.jpg)


## Official Masa Finance
* Web https://masa.finance/
* Doc https://developers.masa.finance/
* Github https://github.com/masa-finance
* Discord https://discord.gg/masafinance
* Twitter https://twitter.com/getmasafi
 
## Hardware minimum requirements
* CPU 2 cores (Intel Xeon Skylake or newer)
* RAM 2GB RAM
* Storage 20 GB

# Install requirement
```bash
sudo apt update && sudo apt upgrade -y
```
```bash
sudo apt install curl tar wget clang pkg-config libssl-dev jq build-essential git make ncdu net-tools -y
```
# Install GO 1.17.11
```bash
ver="1.17.11"
cd $HOME
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
rm "go$ver.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bash_profile
source ~/.bash_profile
go version
```
# build binary
```bash
cd $HOME
rm -rf masa-node-v1.0
git clone https://github.com/masa-finance/masa-node-v1.0

cd masa-node-v1.0/src
git checkout v1.03
make all
```

# copy binaries
```bash
cd $HOME/masa-node-v1.0/src/build/bin
sudo cp * /usr/local/bin
```
# init
```bash
cd $HOME/masa-node-v1.0
geth --datadir data init ./network/testnet/genesis.json
```
setting nodename, please replace `MyNodeName`with your name
```bash
MASA_NODENAME="MyNodeName"
echo 'export MASA_NODENAME='$MASA_NODENAME >> $HOME/.bash_profile
source ~/.bash_profile
```

# Create service
you can replace port whatever you want `--http --http.corsdomain "*" --http.vhosts "*" --http.addr 127.0.0.1 --http.port 8545 \` just replace `8545`
```bash
tee $HOME/masad.service > /dev/null <<EOF
[Unit]
Description=MASA103
After=network.target
[Service]
Type=simple
User=$USER
ExecStart=$(which geth) \
  --identity ${MASA_NODENAME} \
  --datadir $HOME/masa-node-v1.0/data \
  --port 30300 \
  --syncmode full \
  --verbosity 5 \
  --emitcheckpoints \
  --istanbul.blockperiod 10 \
  --mine \
  --miner.threads 1 \
  --networkid 190260 \
  --http --http.corsdomain "*" --http.vhosts "*" --http.addr 127.0.0.1 --http.port 8545 \
  --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,istanbul \
  --maxpeers 50 \
  --bootnodes enode://136ae18de4e57e15e7dc70b03d59db11e77ae45de8ba89a243734b911b94477a3fa515d8a494c1ea79b97e134a17f04db9ff4e90e09e1c2bdba3e9aa061bf6ae@185.167.120.159:30300,enode://91a3c3d5e76b0acf05d9abddee959f1bcbc7c91537d2629288a9edd7a3df90acaa46ffba0e0e5d49a20598e0960ac458d76eb8fa92a1d64938c0a3a3d60f8be4@54.158.188.182:21000,enode://ac6b1096ca56b9f6d004b779ae3728bf83f8e22453404cc3cef16a3d9b96608bc67c4b30db88e0a5a6c6390213f7acbe1153ff6d23ce57380104288ae19373ef@54.146.254.245:21000,enode://91a3c3d5e76b0acf05d9abddee959f1bcbc7c91537d2629288a9edd7a3df90acaa46ffba0e0e5d49a20598e0960ac458d76eb8fa92a1d64938c0a3a3d60f8be4@54.158.188.182:21000,enode://d87c03855093a39dced2af54d39b827e4e841fd0ca98673b2e94681d9d52d2f1b6a6d42754da86fa8f53d8105896fda44f3012be0ceb6342e114b0f01456924c@34.225.220.240:21000,enode://fcb5a1a8d65eb167cd3030ca9ae35aa8e290b9add3eb46481d0fbd1eb10065aeea40059f48314c88816aab2af9303e193becc511b1035c9fd8dbe97d21f913b9@52.1.125.71:21000
Restart=on-failure
RestartSec=10
LimitNOFILE=4096
Environment="PRIVATE_CONFIG=ignore"
[Install]
WantedBy=multi-user.target
EOF
```
# Move masa service to system
```bash
sudo mv $HOME/masad.service /etc/systemd/system
```
# Start service
```bash
sudo systemctl daemon-reload
sudo systemctl enable masad
sudo systemctl restart masad
```
check masa log
```bash
journalctl -u masad -f -o cat
```
# Backup NodeID
Please save your NodeID on your private location, 
```bash
cat $HOME/masa-node-v1.0/data/geth/nodekey
```
# Restore old NodeID 
if you participate before you can restore your NodeID by following command, Default location Nodeid is `$HOME/masa-node-v1.0/data/geth/nodekey`
please replace `<YOUR_NODE_KEY>` example `echo 69a1851b4f33e64bb44fb58640444fe6u9167264c63447456a93da5a7032115f > $HOME/masa-node-v1.0/data/geth/nodekey`
```bash
echo <YOUR_NODE_KEY> > $HOME/masa-node-v1.0/data/geth/nodekey
systemctl restart masad.service
```

# Useful command
check ETH node status  
```bash
geth attach ipc:$HOME/masa-node-v1.0/data/geth.ipc
```
check masa NodeID
```bash
geth attach ipc:$HOME/masa-node-v1.0/data/geth.ipc --exec web3.admin.nodeInfo.enode | sed 's/^.//;s/.$//'
```
additional info for check masa node
* `eth.syncing`      show synchronization status NODE
* `net.peerCount`    show connected peer count
* `admin.nodeInfo`   show node status current block height
 
Masa log
```bash
journalctl -u masad -f | grep "new block"
```
Remove Node
```bash
sudo systemctl stop masad
sudo systemctl stop masad.service
sudo systemctl disable masad.service
sudo rm /etc/systemd/system/masa* -rf
sudo rm $(which masa) -rf
sudo rm $(which masa-node-v1.0) -rf
sudo rm $HOME/.masa-node-v1.0* -rf
sudo rm $HOME/masa-node-v1.0 -rf
```
