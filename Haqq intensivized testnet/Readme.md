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
Make bash profile
```bash
source $HOME/.bash_profile
```
check status sync 
```bash
haqqd status 2>&1 | jq .SyncInfo
```
Quick synch Node (Optional)
```bash
sudo systemctl stop haqqd 
haqqd tendermint unsafe-reset-all --home $HOME/.haqqd --keep-addr-book 
pruning="custom" 
pruning_keep_recent="100" 
pruning_keep_every="0" 
pruning_interval="10" 
sed -i -e "s/^pruning *=.*/pruning = \"$pruning\"/" $HOME/.haqqd/config/app.toml 
sed -i -e "s/^pruning-keep-recent *=.*/pruning-keep-recent = \"$pruning_keep_recent\"/" $HOME/.haqqd/config/app.toml 
sed -i -e "s/^pruning-keep-every *=.*/pruning-keep-every = \"$pruning_keep_every\"/" $HOME/.haqqd/config/app.toml 
sed -i -e "s/^pruning-interval *=.*/pruning-interval = \"$pruning_interval\"/" $HOME/.haqqd/config/app.toml 
cd 
rm -rf ~/.haqqd/data; \ 
wget -O - http://snap.stake-take.com:8000/haqq.tar.gz | tar xf - 
mv $HOME/root/.haqqd/data $HOME/.haqqd 
rm -rf $HOME/root 
wget -O $HOME/.haqqd/config/addrbook.json "https://raw.githubusercontent.com/StakeTake/guidecosmos/main/haqq/haqq_53211-1/addrbook.json" 
sudo systemctl restart haqqd
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
haqqd keys add list
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
Make sure your status of node must be `false` and your wallet has funded
you can check your status sync
```bash
haqqd status 2>&1 | jq .SyncInfo
```

Create Validator
```bash
haqqd tx staking create-validator \
  --amount 10000000aISLM \
  --pubkey $(haqqd tendermint show-validator) \
  --moniker $NODENAME \
  --chain-id $HAQQ_CHAIN_ID \
  --commission-rate="0.10" \
  --commission-max-rate="0.20" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1000000" \
  --gas-prices="0.025aISLM" \
  --from $WALLET \
  --node https://rpc.tm.testedge.haqq.network:443
  --keyring-backend file
```
After Validator Created you can check here https://exp.nodeist.net/Haqq/staking and Register instensi testnet https://haqq-network.typeform.com/to/zEgmX3TO

## 2.1 Useful Command
Edit Validator
```bash
haqqd tx staking edit-validator \
 --chain-id $HAQQ_CHAIN_ID \
 --identity="<your_keybase_id>" \
 --details="<your_validator_description>" \
 --website="<your_website>" \
 --from $WALLET \
 --fees 0.025aISLM \
 --keyring-backend file
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
