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

## Upgrade TTFSC to v0.33.1 updated 11/19/2023
> Transformer Testnet phase for public LIVE:

Update of v0.33.1
✅ Fix the problem that the return value of RPC interface is wrong.
✅ Solve the problem that contract transactions can not be synchronized in some cases.
✅ Increase RPC thread processing capacity to support more concurrent processing of requests.

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
wget -q -O tmp.zip https://fastcdn.uscloudmedia.com/transformers/formal/tfs_v0.33.1_92c26db_testnet.zip && unzip tmp.zip && rm tmp.zip
chmod +x tfs_v0.33.1_92c26db_testnet
```

init config file, will generate new `config.json`
```bash
./tfs_v0.33.1_92c26db_testnet
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
./tfs_v0.33.1_92c26db_testnet -m
```
Make your TFSC service on Background 
```bash
cd
cd tfsc
screen -dmS tfsc bash -c './tfs_v0.33.1_92c26db_testnet -m'
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
