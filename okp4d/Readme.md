![okp4-banner](https://user-images.githubusercontent.com/81378817/200026648-50176202-f24f-4fc2-9fa9-a71e8f774a7d.png)

## Official Documentation
1. [Discord](https://discord.gg/sf4Q8kKV)
2. [website](https://okp4.network/)
3. [Register Testnet](https://nemeton.okp4.network/) 
4. [Github](https://github.com/okp4)
5. [Medium](https://blog.okp4.network/) 

## Hardware minimum requirements  
* CPU 3 cores (Intel Xeon Skylake or newer)
* RAM 4GB RAM
* Storage 80 GB

## Instalation
Automatic Install
```bash
wget -O okp4d.sh https://raw.githubusercontent.com/fatalbar/Testnet-validator/main/okp4d/okp4d.sh && chmod +x okp4d.sh && ./okp4d.sh
```
> After complete upgrade you can following command below

Make bash profile
```bash
source $HOME/.bash_profile
```
check status sync 
```bash
okp4d status 2>&1 | jq .SyncInfo
```

## Create Wallet 
create new wallet
```bash
okp4d keys add $WALLET
```
you also can recover your old wallet
```bash
okp4d keys add $WALLET --recover
```
check your wallet list
```bash
okp4d keys list
```
Save your wallet on bash Profile
```bash
OKP4D_WALLET_ADDRESS=$(okp4d keys show $WALLET -a)
OKP4D_VALOPER_ADDRESS=$(okp4d keys show $WALLET --bech val -a)
echo 'export OKP4D_WALLET_ADDRESS='${OKP4D_WALLET_ADDRESS} >> $HOME/.bash_profile
echo 'export OKP4D_VALOPER_ADDRESS='${OKP4D_VALOPER_ADDRESS} >> $HOME/.bash_profile
source $HOME/.bash_profile
```

## Funding your wallet
Goto [Discord](https://discord.gg/sf4Q8kKV) and send request Faucet
![Screenshot_121](https://user-images.githubusercontent.com/81378817/200036365-9151319b-62eb-478b-8c6d-8052ba11fac8.jpg)
or visite faucet website
https://faucet.okp4.network/

Check balance
```bash
okp4d query bank balances $OKP4D_WALLET_ADDRESS
```

## Create Validator
Make sure your status of node must be catching up `false` and your wallet has funded
you can check your status sync
```bash
okp4d status 2>&1 | jq .SyncInfo
```

Create Validator

plese replace `moniker` `identity` `details` with your own Details
<html>
<body>
<!--StartFragment-->

Name | Type | Description
-- | -- | --
moniker | NODE | Name of your VALIDATOR NODE
identity | NODE | Your Identity ID from keybase.io
details | NODE | Detail of Your Validator

<!--EndFragment-->
</body>
</html>

```bash
okp4d tx staking create-validator \
--amount=1000000uknow \
--pubkey=$(okp4d tendermint show-validator) \
--moniker="your name NODE" \
--identity=change with your ID keybase.io \
--details="your detail node" \
--chain-id=okp4-nemeton \
--commission-rate=0.10 \
--commission-max-rate=0.20 \
--commission-max-change-rate=0.01 \
--min-self-delegation=1 \
--from=wallet \
--gas-prices=0.1uknow \
--gas-adjustment=1.5 \
--gas=auto \
-y 
```
After Validator Created you can check here https://exp.nodeist.net/T-Haqq/staking/ and Register instensi testnet https://haqq-network.typeform.com/to/zEgmX3TO

Now you can Delegate some Amount to your Validator, change 1ISLM with amount you want 
```bash
okp4d tx staking delegate $OKP4D_VALOPER_ADDRESS 1000000uknow --from=$WALLET --chain-id=$OKP4D_CHAIN_ID
```
## Useful Command
Edit Validator
```bash
okp4d tx staking edit-validator \
--new-moniker="your name NODE" \
--identity=change with your ID keybase.io \
--details="your detail node" \
--chain-id=okp4-nemeton \
--commission-rate=0.1 \
--from=wallet \
--gas-prices=0.1uknow \
--gas-adjustment=1.5 \
--gas=auto \
-y 
```
Unjail Validator
```bash
okp4d tx slashing unjail --from wallet --chain-id okp4-nemeton --gas-prices 0.1uknow --gas-adjustment 1.5 --gas auto -y 
```
Delegate and Stake to your Validator
```bash
okp4d tx staking delegate $OKP4D_VALOPER_ADDRESS 1000000uknow --from=$WALLET --chain-id=$OKP4D_CHAIN_ID
```
Redelegate to other Validator
```bash
okp4d tx staking redelegate <ValidatorAddress> <destValidatorAddress> 1000000uknow --from=$WALLET --chain-id=$OKP4D_CHAIN_ID
```
Radeem All your Reward 
```bash
okp4d tx distribution withdraw-all-rewards --from=$WALLET --chain-id=$OKP4D_CHAIN_ID
```
Radeem your reward with commision
```bash
okp4d tx distribution withdraw-rewards $OKP4D_VALOPER_ADDRESS --from=$WALLET --commission --chain-id=$OKP4D_CHAIN_ID
```
check log
```bash
journalctl -fu okp4d -o cat
```
Start service
```bash
sudo systemctl start okp4d
```
Stop service
```bash
sudo systemctl stop okp4d
```
Restart service
```bash
sudo systemctl restart okp4d
```

Synchronization info
```bash
okp4d status 2>&1 | jq .SyncInfo
```
Validator info
```bash
okp4d status 2>&1 | jq .ValidatorInfo
```
Node info
```bash
okp4d status 2>&1 | jq .NodeInfo
```
Show node id
```bash
okp4d tendermint show-node-id
```
Delete Node
```bash
sudo systemctl stop okp4d && sudo systemctl disable okp4d && sudo rm /etc/systemd/system/okp4d.service && sudo systemctl daemon-reload && rm -rf $HOME/.okp4d  && rm $(which okp4d) 
```
