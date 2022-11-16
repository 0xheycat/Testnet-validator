
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

Install requirement
```bash
sudo apt install make clang pkg-config libssl-dev libclang-dev build-essential git curl ntp jq llvm tmux htop screen unzip cmake -y
```
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
## install
clone launch
```bash
cd ~/
git clone https://github.com/maticnetwork/launch
```

```bash
mkdir -p node
cp -rf launch/testnet-v4/sentry/sentry/* ~/node
```
download service
```bash
cd ~/node
wget https://raw.githubusercontent.com/maticnetwork/launch/master/testnet-v4/service.sh
```
```bash
sudo mkdir -p /etc/matic
sudo chmod -R 777 /etc/matic/
touch /etc/matic/metadata
```

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

edit `start.sh`
```bash
nano ~/node/bor/start.sh
```
insert bootnodes
```bash
--bootnodes "enode://0cb82b395094ee4a2915e9714894627de9ed8498fb881cec6db7c65e8b9a5bd7f2f25cc84e71e89d0947e51c76e85d0847de848c7782b13c0255247a6758178c@44.232.55.71:30303,enode://88116f4295f5a31538ae409e4d44ad40d22e44ee9342869e7d68bdec55b0f83c1530355ce8b41fbec0928a7d75a5745d528450d30aec92066ab6ba1ee351d710@159.203.9.164:30303"
```
![Screenshot_141](https://user-images.githubusercontent.com/81378817/202087329-b7aa7f1a-9e3b-4a2d-bee5-aa7618058454.jpg)

Start Heimdall service
```bash
systemctl heimdalld enable
systemctl heimdalld start
journalctl -u -f hemdalld -n 100
```

```bash
curl localhost:26657/status
```
