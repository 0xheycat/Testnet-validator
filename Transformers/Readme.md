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

## Upgrade TTFSC to v0.15.1 updated 21/nov/2022 (Latest version)
> Transformer 2nd phase for public LIVE:

Update of v0.15.1
✅ Remove on-chain TPS as a calculation parameter for gas and change it to UTXO's storage cost as an important basis for gas composition.
✅ Solve the problem of duplicate selection when VRF selects voting nodes.
✅ Solve the possible failure of the block replenishment protocol caused by the lack of pre-hash when broadcasting a block build.
✅ Solve the calculation error of claiming reward funds.
✅ Update third party open source libraries: RocksDB changed to v7.6.0 and protobuf changed to v3.21.9.

## additional Instructions: 

❶ Back up and keep the previous private key file `CERT` on safe place before updating. you can find your previous cert file directory `$HOME/tfsc/cert`


Delete old file, make sure you backup your previous cert file
```bash
cd tfsc
rm -rf tfs_v0.14.0_282756b_devnet
rm -rf config.json
```

Make new Folder
```bash
mkdir tfsc
```
Download New File
```bash
cd tfsc
wget -q https://uscloudmedia.s3.us-west-2.amazonaws.com/transformers/test/tfs_v0.15.1_1023a80_devnet
chmod +x tfs_v0.15.1_1023a80_devnet
```

init config file, will generate new `config.json`
```bash
./tfs_v0.15.1_1023a80_devnet
```

Setting your IP automatically to `config.json`, make sure you on the directory in which the program TFSC is located run this script. 
```bash
cd
cd tfsc
PUB_IP=$(wget -qO- eth0.me);wget -qO- pastebin.com/raw/MfS126mf|sed 's#\"ip\": \"pub_ip\"#\"ip\": '\"${PUB_IP}\"'#' > config.json
```

Running Node 
```bash
cd
cd tfsc
./tfs_v0.15.1_1023a80_devnet -m
```
Make your TFSC service on Background 
```bash
cd
cd tfsc
screen -dmS tfsc bash -c './tfs_v0.15.1_1023a80_devnet -m'
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
