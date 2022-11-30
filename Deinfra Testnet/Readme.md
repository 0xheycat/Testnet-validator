## List
* Register Tesnet Phase 1 https://github.com/fatalbar/Testnet-validator/blob/main/Deinfra%20Testnet/Register%20PHASE%201.md
* Install Teaclient https://github.com/fatalbar/Testnet-validator/blob/main/Deinfra%20Testnet/clienttea.md
* Install Erlang https://github.com/fatalbar/Testnet-validator/blob/main/Deinfra%20Testnet/erlang24.3.md
* Troubleshooting https://github.com/fatalbar/Testnet-validator/blob/main/Deinfra%20Testnet/troubleshoot.md

## Instruction
Before running NODE you must install Erlang on your local system 

## Install TPNODE 
```bash
git clone https://github.com/thepower/tpnode.git
cd tpnode
```
Delete the previous builds Tpnode
```bash
rm -rf _build/default/*
```
Download the dependencies
```bash
./rebar3 get-deps
```
Compile the node source by running the following command:
```bash
./rebar3 compile
```
Build the release by running the following command:
```bash
./rebar3 release
```
Copy the node directory from `_build/default/rel/thepower` to `/opt` by running the following command:
```bash
cp -r _build/default/rel/thepower /opt
```
Copy genesis file and config
* please edit `node.config` you can configure node.config by following this link https://github.com/thepower/tpnode/blob/master/guides/tpNodeConfiguration.md
* or you can get `node.config` and `genesis.txt` by running ceremony Tea client https://github.com/fatalbar/Testnet-validator/blob/main/Deinfra%20Testnet/clienttea.md

## Install SSL
Please Replace `HOSTNAME` with your hostname from `node.config` example `c1056n5`

```bash
acme.sh --server letsencrypt --issue --standalone  -d HOSTNAME.thepower.io
acme.sh --install-cert -d HOSTNAME.thepower.io \
--cert-file /opt/thepower/db/cert/HOSTNAME.thepower.io.crt \
--key-file /opt/thepower/db/cert/HOSTNAME.thepower.io.key \
--ca-file /opt/thepower/db/cert/HOSTNAME.thepower.io.crt.ca.crt
acme.sh --info -d HOSTNAME.thepower.io
```

## Running NODE
* With Docker
```bash
cd /opt/thepower
```
```bash
mkdir {db,log}
```
move `node.config` and `genesis.txt` from teaclient directory
```bash
cp $HOME/teaclient/node.config /opt/thepower/node.config
cp $HOME/teaclient//genesis.txt /opt/thepower/genesis.txt
```
Runnig NODE
```bash
docker run -d \
--name tpnode \
--restart unless-stopped \
--mount type=bind,source="$(pwd)"/db,target=/opt/thepower/db \
--mount type=bind,source="$(pwd)"/log,target=/opt/thepower/log \
--mount type=bind,source="$(pwd)"/node.config,target=/opt/thepower/node.config \
--mount type=bind,source="$(pwd)"/genesis.txt,target=/opt/thepower/genesis.txt \
-p 1800:1800 \
-p 1080:1080 \
-p 1443:1443 \
thepowerio/tpnode
```

Check status NODE, please replace `HOSTNAME`
```bash
curl http://HOSTNAME.thepower.io:1080/api/node/status | jq
```
check on your browser
```bash
http://HOSTNAME.thepower.io:1080/api/node/status
```
Back to BOT and click following instruction 

![Screenshot_178](https://user-images.githubusercontent.com/81378817/204818743-7e948eef-cdfd-4160-a160-866697821c83.jpg)

Need some times to sync, after you got HEIGHT from your NODE you can send LINK status NODE on BOT
Thank you
