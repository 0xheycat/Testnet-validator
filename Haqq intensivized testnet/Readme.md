![188024190-b43f56d0-2dc6-4e4a-be0e-a7e9f615f751](https://user-images.githubusercontent.com/81378817/188311294-168cfb42-70c6-4de0-84c8-6f6c616bcc07.png)

## 1.0 Official Documentation
* https://docs.haqq.network
* https://github.com/haqq-network
* Mainet explorer https://explorer.haqq.network/
* Testnet Explorer https://explorer.testedge.haqq.network/
* Discord https://discord.gg/hWJbjRkDQF
* 
## 1.1 Hardware minimum requirements
* CPU 4 cores (Intel Xeon Skylake or newer)
* RAM 32GB RAM
* Storage 500 GB

## 1.2 Register intensivized Testnet 
https://haqq-network.typeform.com/to/zEgmX3TO

## Instalation 
Automatic instalation 
```bash
wget -O haqq.sh https://raw.githubusercontent.com/fatalbar/testnet-manual/main/Haqq%20intensivized%20testnet/haqq.sh && chmod +x haqq.sh && ./haqq.sh
```
## 🟢Update binary haqqd to v1.0.3 Automatic (Quick Install)
```bash
wget -O upgrade%20haqqd%20v1.0.3.sh https://raw.githubusercontent.com/fatalbar/testnet-manual/main/Haqq%20intensivized%20testnet/upgrade%20haqqd%20v1.0.3.sh && chmod +x upgrade%20haqqd%20v1.0.3.sh && ./upgrade%20haqqd%20v1.0.3.sh
```
> After complete upgrade you can following command below

Make bash profile
```bash
source $HOME/.bash_profile
```
check status sync 
```bash
haqqd status 2>&1 | jq .SyncInfo
```

## 1.3 Create Wallet 
create new wallet
```bash
haqqd keys add $WALLET
```
you also can recover your old wallet
```bash
haqqd keys add $WALLET --recover
```
check your wallet list
```bash
haqqd keys list
```
Save your wallet on bash Profile
```bash
HAQQ_WALLET_ADDRESS=$(haqqd keys show $WALLET -a)
HAQQ_VALOPER_ADDRESS=$(haqqd keys show $WALLET --bech val -a)
echo 'export HAQQ_WALLET_ADDRESS='${HAQQ_WALLET_ADDRESS} >> $HOME/.bash_profile
echo 'export HAQQ_VALOPER_ADDRESS='${HAQQ_VALOPER_ADDRESS} >> $HOME/.bash_profile
source $HOME/.bash_profile
```

## 1.4 Funding your wallet
You need private keys to export your wallet to website,  
```bash
haqqd keys unsafe-export-eth-key $WALLET
```
Copy your private keys then import to Metamask,now you can Claim faucet There https://testedge.haqq.network/

![Screenshot_211](https://user-images.githubusercontent.com/81378817/188313277-c96e1907-01a1-4386-a7e4-4a12ddb04ea6.jpg)

You can save new RPC by click `switch to Haqq testedge`

Check balance
```bash
haqqd query bank balances $HAQQ_WALLET_ADDRESS
```

## 2.0 Create Validator
Make sure your status of node must be catching up `false` and your wallet has funded
you can check your status sync
```bash
haqqd status 2>&1 | jq .SyncInfo
```

Create Validator
```bash
haqqd tx staking create-validator \
  --amount 10000000aISLM \
  --from $WALLET \
  --commission-rate="0.10" \
  --commission-max-rate="0.20" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1000000" \
  --pubkey $(haqqd tendermint show-validator) \
  --moniker $NODENAME \
  --chain-id $HAQQ_CHAIN_ID \
  --gas-prices="0.025aISLM" \
  --node https://rpc.tm.testedge.haqq.network:443
```
After Validator Created you can check here https://exp.nodeist.net/Haqq/staking and Register instensi testnet https://haqq-network.typeform.com/to/zEgmX3TO

Now you can Delegate some Amount to your Validator, change 1ISLM with amount you want 
```bash
haqqd tx staking delegate $HAQQ_VALOPER_ADDRESS 1ISLM --from=$WALLET --chain-id=$HAQQ_CHAIN_ID
```
## 2.1 Useful Command
Edit Validator
```bash
haqqd tx staking edit-validator \
 --chain-id $HAQQ_CHAIN_ID \
 --identity="<your_keybase_id>" \
 --details="<your_validator_description>" \
 --website="<your_website>" \ 
 --from $WALLET
```
Unjail Validator
```bash
haqqd tx slashing unjail \
  --broadcast-mode=block \
  --from=$WALLET \
  --chain-id=$HAQQ_CHAIN_ID
```
Delegate and Stake to your Validator
```bash
haqqd tx staking delegate $HAQQ_VALOPER_ADDRESS 1ISLM --from=$WALLET --chain-id=$HAQQ_CHAIN_ID
```
Redelegate to other Validator
```bash
haqqd tx staking redelegate <ValidatorAddress> <destValidatorAddress> 1ISLM --from=$WALLET --chain-id=$HAQQ_CHAIN_ID
```
Radeem All your Reward 
```bash
haqqd tx distribution withdraw-all-rewards --from=$WALLET --chain-id=$HAQQ_CHAIN_ID
```
Radeem your reward with commision
```bash
haqqd tx distribution withdraw-rewards $HAQQ_VALOPER_ADDRESS --from=$WALLET --commission --chain-id=$HAQQ_CHAIN_ID
```
check log
```bash
journalctl -fu haqqd -o cat
```
Start service
```bash
sudo systemctl start haqqd
```
Stop service
```bash
sudo systemctl stop haqqd
```
Restart service
```bash
sudo systemctl restart haqqd
```

Synchronization info
```bash
haqqd status 2>&1 | jq .SyncInfo
```
Validator info
```bash
haqqd status 2>&1 | jq .ValidatorInfo
```
Node info
```bash
haqqd status 2>&1 | jq .NodeInfo
```
Show node id
```bash
haqqd tendermint show-node-id
```
Delete Node
```bash
sudo systemctl stop haqqd
sudo systemctl disable haqqd
sudo rm /etc/systemd/system/haqq* -rf
sudo rm $(which haqqd) -rf
sudo rm $HOME/.haqqd* -rf
sudo rm $HOME/haqq -rf
sed -i '/HAQQ_/d' ~/.bash_profile
```

## Troubleshoting

1. how to fix current error 

![Screenshot_9](https://user-images.githubusercontent.com/81378817/189382197-094c1a78-4d0e-4cfd-8cfe-13c3fac3a428.png)

Answer= Go to Directory `/$HOME/.haqqd/config/app.toml`  

> you can use this command
```bash
sudo nano /$HOME/.haqqd/config/app.toml
```
> scrool down and find `JSON RPC Configuration` like pic below and replace with new port `example 9545 & 9546` and save with `CTRL+X`

![Screenshot_10](https://user-images.githubusercontent.com/81378817/189384512-ab00e579-122c-4515-a0e5-17598385cbfb.png)

> restart your Node
```bash
sudo systemctl daemon-reload && \
sudo systemctl enable haqqd && \
sudo systemctl restart haqqd && \
sudo journalctl -u haqqd -f -o cat
```

> now your node will start synchron 

![Screenshot_11](https://user-images.githubusercontent.com/81378817/189385475-84baea3c-2edd-401b-85f3-d4743e720b67.png)
