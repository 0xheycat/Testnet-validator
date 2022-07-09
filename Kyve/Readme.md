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

## 1.2 Moonbeam pool
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

## 1.3 Avalanche pool
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

## 1.3 STACK pool

```bash
```








