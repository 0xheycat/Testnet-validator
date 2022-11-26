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
Copy genesis file and config, please edit `node.config` you can configure node.config by following this link https://github.com/thepower/tpnode/blob/master/guides/tpNodeConfiguration.md
```bash
cp $HOME/tpnode/node.config /opt/thepower/node.config
cp $HOME/tpnode//genesis.txt /opt/thepower/genesis.txt
```
## Running NODE
```bash
cd /opt/thepower
```
```bash
./bin/thepower foreground
```
Check status NODE, please replace `yourIP`
```bash
curl http://yourIP:1080/api/node/status | jq
```
