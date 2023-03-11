welcome to Transformer testnet 

## Official Documentation
* [Official website](https://www.tfsc.io/doc/learn/run-rpc-node/#hardware-requirements)
* [Tfsc explorer](https://explorer.tfsc.io/)
* [Discord](https://discord.gg/qWEd5jdftY)

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

* **Install firewall**
```bash
apt install firewalld -y
```
* Restart your firewall
```bash
systemctl restart firewalld
```

* **Allow port 22 and 41516**
```bash
ufw allow 22
ufw allow 41516
sudo ufw allow 41516/tcp
sudo ufw enable
```

## Upgrade TTFSC to v0.20.1 updated 05/1/2023
> Transformer 2nd phase for public LIVE:

Update of v0.20.1
✅Added block replenishment protocol to the validation synchronization process.
✅Solved the deadlock problem when block pools broadcast transactions.

## additional Instructions: 

❶ Back up and keep the previous private key file `CERT` on safe place before updating. you can find your previous cert file directory `$HOME/tfsc/cert`


Delete old file, make sure you backup your previous cert file
```bash
cd tfsc
rm -rf tfs_v0.20.0_1c5f089_devnet
rm -rf config.json
```

Make new Folder
```bash
mkdir tfsc
```
Download New File
```bash
cd tfsc
wget -c fastcdn.uscloudmedia.com/transformers/test/tfs_v0.21.0_b011fcd_devnet
chmod +x tfs_v0.21.0_b011fcd_devnet
```

init config file, will generate new `config.json`
```bash
./tfs_v0.21.0_b011fcd_devnet
```

Setting your IP automatically to `config.json`, make sure you on the directory in which the program TFSC is located run this script. 
```bash
cd
cd tfsc
PUB_IP=$(wget -qO- eth0.me);wget -qO- https://raw.githubusercontent.com/fatalbar/Testnet-validator/main/Transformers/config.json|sed 's#\"ip\": \"pub_ip\"#\"ip\": '\"${PUB_IP}\"'#' > config.json
```

Running Node 
```bash
cd
cd tfsc
./tfs_v0.21.0_b011fcd_devnet -m
```
Make your TFSC service on Background 
```bash
cd
cd tfsc
screen -dmS tfsc bash -c './tfs_v0.21.0_b011fcd_devnet -m'
```
To back your screen, to close without terminating `CTRL+A+D`
```bash
screen -x tfsc 
```
Done you succesfull update with latest version
you can check your Node, paste with your address https://explorer.tfsc.io/

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
wget -O data.db.tar https://uscloudmedia.s3.us-west-2.amazonaws.com/transformers/db/data.29004.tar.gz
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
