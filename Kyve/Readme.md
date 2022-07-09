Welcome To Kyve Testnet

## 1.0 Official KYVE Document

* [Website](https://app.kyve.network/#/)
* [Kyve Task](https://app.kyve.network/#/korellia/tasks)
* [Github](https://github.com/KYVENetwork)

_Before installing, make sure you have enough tokens for the minimum staking, otherwise your node will not work. To see the minimum staking, open the pool and go to [Validators](https://app.kyve.network/#/pools), if you don’t have enough tokens you can do other [Kyve Task](https://app.kyve.network/#/korellia/tasks)._

## 1.1 Install Automatic 
```bash
wget -O kyve.sh https://raw.githubusercontent.com/fatalbar/testnet-manual/main/Kyve/kyve.sh && chmod +x kyve.sh && ./kyve.sh
```
## 1.2 Cosmos Hub pool
You an find cosmos validator [Cosmos hub Validator](https://app.kyve.network/#/pools/9/validators) _make sure you have enough tokens for the minimum staking_

```bash
systemctl restart cosmosd
```

```bash
systemctl stop cosmosd
```
```bash
journalctl -u cosmosd -f
```
Change Amount_STAKE with number want to stake

```bash
STAKE=Amount_STAKE
sed -i.bak -e "s/initialStake .*/initialStake $STAKE/" /etc/systemd/system/cosmosd.service
systemctl daemon-reload
systemctl restart cosmosd
```

## 1.3 Moonbeam pool
You an find Moonbeam validator [Moonbeam Validator](https://app.kyve.network/#/pools/0/validators) _make sure you have enough tokens for the minimum staking_
```bash
systemctl restart moonbeamd
```

```bash
systemctl stop moonbeamd
```
```bash
journalctl -u moonbeamd -f
```
Change Amount_STAKE with number want to stake

```bash
STAKE=Amount_STAKE
sed -i.bak -e "s/initialStake .*/initialStake $STAKE/" /etc/systemd/system/moonbeamd.service
systemctl daemon-reload
systemctl restart moonbeamd
```

## 1.4 Avalanche pool
You an find Avalanche validator [Avalanche Validator](https://app.kyve.network/#/pools/1/validators) _make sure you have enough tokens for the minimum staking_
```bash
systemctl restart avalanched
```

```bash
systemctl stopavalanched
```
```bash
journalctl -u avalanched -f
```
Change Amount_STAKE with number want to stake

```bash
STAKE=Amount_STAKE
sed -i.bak -e "s/initialStake .*/initialStake $STAKE/" /etc/systemd/system/avalanched.service
systemctl daemon-reload
systemctl restart avalanched
```

## 1.5 STACK pool
```bash
systemctl restart stacksd
```

```bash
systemctl stop stacksd
```
```bash
journalctl -u stacksd -f
```
Change Amount_STAKE with number want to stake

```bash
STAKE=Amount_STAKE
sed -i.bak -e "s/initialStake .*/initialStake $STAKE/" /etc/systemd/system/stacksd.service
systemctl daemon-reload
systemctl restart stacksd
```

## 2.0 Bitcoin pool
You an find Bitcoin validator [Bitcoin Validator]([https://app.kyve.network/#/pools/1/validators) _make sure you have enough tokens for the minimum staking_ 
```bash
systemctl restart bitcoind
```

```bash
systemctl stop bitcoind
```
```bash
journalctl -u bitcoind -f
```
Change Amount_STAKE with number want to stake

```bash
STAKE=Amount_STAKE
sed -i.bak -e "s/initialStake .*/initialStake $STAKE/" /etc/systemd/system/bitcoind.service
systemctl daemon-reload
systemctl restart bitcoind
```

## 2.1 Solana pool
You an find SOLANA validator [SOLANA Validator]([https://app.kyve.network/#/pools/4/validators) _make sure you have enough tokens for the minimum staking_
```bash
systemctl restart solanad
```

```bash
systemctl stop solanad
```
```bash
journalctl -u solanad -f
```
Change Amount_STAKE with number want to stake

```bash
STAKE=Amount_STAKE
sed -i.bak -e "s/initialStake .*/initialStake $STAKE/" /etc/systemd/system/solanad.service
systemctl daemon-reload
systemctl restart solanad
```

## 2.2 Zilliqa pool
You an find Zilliqa validator [Zilliqa Validator]([https://app.kyve.network/#/pools/5/validators) _make sure you have enough tokens for the minimum staking_
```bash
systemctl restart zilliqad
```

```bash
systemctl stop zilliqad
```
```bash
journalctl -u zilliqad -f
```
Change Amount_STAKE with number want to stake

```bash
STAKE=Amount_STAKE
sed -i.bak -e "s/initialStake .*/initialStake $STAKE/" /etc/systemd/system/zilliqad.service
systemctl daemon-reload
systemctl restart zilliqad
```

## 2.3 Install Wallet
Download ektention [Keplr](https://chrome.google.com/webstore/detail/keplr/dmkamcknogkgcdfhhbddcghachkejeap)
You can get faucet from [Faucet](https://app.kyve.network/#/faucet)


Thank you






