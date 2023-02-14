
![74104543](https://user-images.githubusercontent.com/81378817/202085913-74ebc3b2-9459-42d1-b668-e9f83054d30d.png)

## Official Documentation
* [Official Doc](https://docs.blastapi.io/)
* [Bware Twiter](https://twitter.com/BwareLabs)
* [Bware API](https://twitter.com/BlastAPI)
* [Github](https://github.com/bwarelabs)
* [Discord](https://discord.gg/pkQVDdJ8qD)

## Hardware minimum requirements
* CPU 4 cores (Intel Xeon Skylake or newer)
* RAM 16GB RAM
* Storage 500 GB

## Install requirement
```bash
sudo apt install make clang pkg-config libssl-dev libclang-dev build-essential git curl ntp jq llvm tmux htop screen unzip cmake -y
```
Install Docker & docker_compose, Resource Docker from SecorD0 thank you [SecorD0](https://github.com/SecorD0/Minima/tree/main/docker)
```bash
. <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/installers/docker.sh)
```
## Install Heimdall
```bash
cd heimdall
git checkout v0.2.11
make install
```
## Install bor
```bash
cd ~/
git clone https://github.com/maticnetwork/bor
cd bor
git checkout v0.2.17
make bor-all
sudo ln -nfs ~/bor/build/bin/bor /usr/bin/bor
sudo ln -nfs ~/bor/build/bin/bootnode /usr/bin/bootnode
```
## clone repository launch
```bash
cd ~/
git clone https://github.com/maticnetwork/launch
```
## Setup Node & Download service
```bash
mkdir -p node
cp -rf launch/testnet-v4/sentry/sentry/* ~/node
```
Download service
```bash
cd ~/node
wget https://raw.githubusercontent.com/maticnetwork/launch/master/testnet-v4/service.sh
```
## Generate the metadata file
```bash
sudo mkdir -p /etc/matic
sudo chmod -R 777 /etc/matic/
touch /etc/matic/metadata
```
## Generate services files and copy them into system directory
```bash
cd ~/node
bash service.sh
sudo cp *.service /etc/systemd/system/
```

```bash
cd ~/node/heimdall
bash setup.sh
```

```bash
cd ~/node/bor
bash setup.sh
```
edit `config.toml`
```bash
nano ~/.heimdalld/config/config.toml
```
* moniker = "Name your validator"
* Change the value of Pex to true
* Change the value of Prometheus to true
* Set the max_open_connections value to 100

## edit `start.sh`

## Add the following flag in  `~/node/bor/start.sh` to the bor start params:
```bash
nano ~/node/bor/start.sh
```

```bash
--bootnodes "enode://320553cda00dfc003f499a3ce9598029f364fbb3ed1222fdc20a94d97dcc4d8ba0cd0bfa996579dcc6d17a534741fb0a5da303a90579431259150de66b597251@54.147.31.250:30303"
```
![Screenshot_141](https://user-images.githubusercontent.com/81378817/202087329-b7aa7f1a-9e3b-4a2d-bee5-aa7618058454.jpg)
## adding seed
```bash
seeds="4cd60c1d76e44b05f7dfd8bab3f447b119e87042@54.147.31.250:26656,b18bbe1f3d8576f4b73d9b18976e71c65e839149@34.226.134.117:26656"
sed -i -e 's|^seeds *=.*|seeds = "'$seeds'"|;' $HOME/.heimdalld/config/config.toml
```
## Configure the following set up the configuration files  `~/.heimdalld/config/heimdall-config.toml`
```bash
sudo nano ~/.heimdalld/config/heimdall-config.toml
```
setting RPC https://houston.blastapi.io/ and insert you rpc from blastapi
```bash
eth_rpc_url =< you can refer to blastapi.io and get your own Matic endpoint, input it here >
```
example
```bash
eth_rpc_url = "https://polygon-testnet.houston.blastapi.io/xxxxxxxxxxxxx:9545"
```
![Screenshot_142](https://user-images.githubusercontent.com/81378817/202092093-82563ea2-0419-4a40-9c38-91afd1aed975.jpg)


## Start Heimdall,heimdalld-rest-server and Bor service
```bash
sudo systemctl heimdalld enable
sudo service heimdalld start
systemctl heimdalld start
sudo service bor start
sudo service heimdalld-rest-server start
```
Congrsts You now have a running Polygon Testnet RPC node. All you need to do now is wait for it to sync. You can check if the node is synced by running the API Call listed below from inside your environment. You are going to need to have the curl and jq packages installed for this, so make sure to install them beforehand.
```bash
curl -H "Content-Type: application/json" -d '{"id":1, "jsonrpc":"2.0", "method": "eth_syncing","params": []}' localhost:8545
```
If the result is false, it means that your node is fully synced.
Another way to check which block the node is at would be running:
```bash
curl -H "Content-Type: application/json" -d '{"id":1, "jsonrpc":"2.0", "method": "eth_blockNumber","params": []}' localhost:8545
```
The Polygon node exports both RPC on port 8545 and WS on port 8546.
In order to test the WS endpoint, we will need to install a package called node-ws.
An example WS call would look like this:
```bash
wscat --connect ws://localhost:8546
> {"id":1, "jsonrpc":"2.0", "method": "eth_blockNumber","params": []}
```
after completed following Task you can register Node https://houston.blastapi.io/provider
![Screenshot_143](https://user-images.githubusercontent.com/81378817/202093002-c7b2d99e-93c7-46dc-9bce-78df3e71a7cb.jpg)

![Screenshot_144](https://user-images.githubusercontent.com/81378817/202093088-f254b4a5-984f-4a26-bca5-12a50676c9fc.jpg)

![Screenshot_145](https://user-images.githubusercontent.com/81378817/202093184-952ae4af-123a-4493-a922-38dba10d3096.jpg)
and fill feedback 

## Additional cmd
check status
```bash
curl localhost:26657/status
```
check log
```bash
journalctl -u -f hemdalld -n 100
```
