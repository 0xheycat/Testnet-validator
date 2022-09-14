welcome to Transformer testnet [Official website](https://www.tfsc.io/doc/learn/run-rpc-node/#hardware-requirements)

## Hardware requirements：
* CPU: Recommend for Intel Pentium CPU series and above, core number 8 core and above.
* Memory: Recommend for 16G And above
* Disk: Recommend for 50G And above

## Software requirements：
* Operation system：Run on CentOS 7、ubuntu-22.04-desktop-amd64 system.

## 1. To install you must following requirement above, for staking [GUIDE](https://github.com/fatalbar/testnet-manual/tree/main/Transformers/staking)

**Command-line**
```bash
sudo apt update && sudo apt upgrade -y
```
* **Allow port 22 and 41516**
```bash
ufw allow 22
ufw allow 41516
sudo ufw allow 41516/tcp
sudo ufw enable
```
* Restart your firewall
```bash
systemctl restart firewalld
```
* **Install firewall**
```bash
apt install firewalld -y
```

## Upgrade TTFSC to 0.5.0 updated 10/sept/2022 (Latest version)
Update Details
1. Solved the problem of block height out of sync
2. Solved the problem of failing to claim rewards or synchronize the network caused by time zone issues. 
3. Solved the problem of some blocks' height showing empty 


Delete old file
```bash
cd tfsc
rm -rf ttfsc_v0.4.0_762f9d0_devnet
rm -rf config.json
```

Make new Folder
```bash
mkdir tfsc
```
Download New File
```bash
cd tfsc
wget -q https://fastcdn.uscloudmedia.com/transformers/test/ttfsc_v0.5.0_cc7126b_devnet
chmod +x ttfsc_v0.5.0_cc7126b_devnet
```

Setting automatically `config.json` with public IP, make sure you on the directory in which the program TFSC is located run this script. 
```bash
cd
cd tfsc
PUB_IP=$(wget -qO- eth0.me);wget -qO- pastebin.com/raw/MfS126mf|sed 's#\"ip\": \"pub_ip\"#\"ip\": '\"${PUB_IP}\"'#' > config.json
```

Running Node 
```bash
cd
cd tfsc
./ttfsc_v0.5.0_cc7126b_devnet -m
```
Make your TFSC service on Background 
```bash
cd tfsc
screen -dmS tfsc bash -c './ttfsc_v0.5.0_cc7126b_devnet -m'
```
To back your screen, to close without terminating `CTRL+A+D`
```bash
screen -x tfsc 
```
Done you succesfull update with latest version

**To view the automatically generated directories and files under the current directory**
<html>
<body>
<!--StartFragment-->

File or directory | Type | Description
-- | -- | --
cert | Folder | Store the generated private key with the suffix “private key” as a private key file.
data.DB | Folder | store the database file
config.json | JSON file | configuration file

<!--EndFragment-->
</body>
</html>


## You have success on first STEP, WAIT for next STEP 
Thank you

## Troubleshooting

1. Stuck block 

Delete your data.db
```bash
cd tfsc
rm -rf data.db
```
Download the file
```bash
wget -O data.db.tar fastcdn.uscloudmedia.com/transformers/db/data.db.67148.tar
```
Extract new db
```bash
tar -xvf data.db.tar
```
Delete old zip file
```bash
rm data.db.tar
```
It's take a few times to sync your node latest block
