![111688630](https://user-images.githubusercontent.com/81378817/192407898-1948a72f-9b5a-401b-aa55-c7cd1a574ce3.jpg)

## Official documentation
* Official website https://mun.money/
* Github https://github.com/munblockchain
* DIscord https://discord.gg/J4uqzjue7Q
* Explorer https://blockexplorer.mun.money/

## System requirement
- OS: Ubuntu 22.04 LTS
- 4-Core CPU
- RAM: 16GB
- Storage 300GB 

## Installation Automatic
```bash
wget -O mun.sh https://raw.githubusercontent.com/fatalbar/Testnet-validator/main/MUN/mun.sh && chmod +x mun.sh && ./mun.sh
```

> After complete upgrade you can following command below

Make bash profile
```bash
source $HOME/.bash_profile
```
check status sync 
```bash
mund status 2>&1 | jq .SyncInfo
```

## 1.3 Create Wallet 
create new wallet
```bash
mund keys add $WALLET
```
you also can recover your old wallet
```bash
mund keys add $WALLET --recover
```
check your wallet list
```bash
mund keys list
```
Save your wallet on bash Profile
```bash
MUN_WALLET_ADDRESS=$(mund keys show $WALLET -a)
MUN_VALOPER_ADDRESS=$(mund keys show $WALLET --bech val -a)
echo 'export MUN_WALLET_ADDRESS='${MUN_WALLET_ADDRESS} >> $HOME/.bash_profile
echo 'export MUN_VALOPER_ADDRESS='${MUN_VALOPER_ADDRESS} >> $HOME/.bash_profile
source $HOME/.bash_profile
```

## 1.4 Funding your wallet

to get faucet please going to [Discord](https://discord.gg/J4uqzjue7Q)

Check balance
```bash
mund query bank balances $MUN_WALLET_ADDRESS
```

## 2.0 Create Validator
Make sure your status of node must be catching up `false` and your wallet has funded
you can check your status sync
```bash
mund status 2>&1 | jq .SyncInfo
```

Create Validator
```bash
mund tx staking create-validator \
  --amount 10000000000utmun \
  --from $WALLET \
  --commission-max-change-rate "0.05" \
  --commission-max-rate "0.20" \
  --commission-rate "0.05" \
  --min-self-delegation "1" \
  --pubkey $(mund tendermint show-validator) \
  --moniker $NODENAME \
  --chain-id testmun \
  --gas 300000 \
  -y
```
you can check your node https://blockexplorer.mun.money/ or https://node1.mun.money/status

Now you can Delegate some Amount to your Validator, change 1TMUN with amount what you want 
```bash
haqqd tx staking delegate $MUN_VALOPER_ADDRESS 1TMUN --from=$WALLET --chain-id=$MUN_CHAIN_ID
```
## 2.1 Useful Command
Edit Validator
```bash
mund tx staking edit-validator \
--moniker="<Yournodename>" \
--identity="<your_keybase_id>" \
--details="<your_validator_description>" \
--chain-id=testmun \
--from=$WALLET \
--gas=auto \
-y 
```
Unjail Validator
```bash
haqqd tx slashing unjail \
  --broadcast-mode=block \
  --from=$WALLET \
  --chain-id=testmun
```
Delegate and Stake to your Validator
```bash
mund tx staking delegate $MUN_VALOPER_ADDRESS 1TMUN --from=$WALLET --chain-id=$MUN_CHAIN_ID
```
Redelegate to other Validator
```bash
mund tx staking redelegate <ValidatorAddress> <destValidatorAddress> 1ISLM --from=$WALLET --chain-id=$MUN_CHAIN_ID
```
Radeem All your Reward 
```bash
mund tx distribution withdraw-all-rewards --from=$WALLET --chain-id=$MUN_CHAIN_ID
```
Radeem your reward with commision
```bash
mund tx distribution withdraw-rewards $MUN_VALOPER_ADDRESS --from=$WALLET --commission --chain-id=$MUN_CHAIN_ID
```
check log
```bash
journalctl -fu mund -o cat
```
Start service
```bash
sudo systemctl start mund
```
Stop service
```bash
sudo systemctl stop mund
```
Restart service
```bash
sudo systemctl restart mund
```

Synchronization info
```bash
mund status 2>&1 | jq .SyncInfo
```
Validator info
```bash
mund status 2>&1 | jq .ValidatorInfo
```
Node info
```bash
mund status 2>&1 | jq .NodeInfo
```
Show node id
```bash
mund tendermint show-node-id
```
Delete Node
```bash
sudo systemctl stop mund
sudo systemctl disable mund
sudo rm /etc/systemd/system/mun* -rf
sudo rm $(which mund) -rf
sudo rm $HOME/.mund* -rf
sudo rm $HOME/mun -rf
sed -i '/MUN_/d' ~/.bash_profile
```
