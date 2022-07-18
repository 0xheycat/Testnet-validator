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

## Upgrade TTFSC to 0.1.0 (Latest version) 07.16.22

Delete old file
```bash
rm -rf ttfsc_0.0.1_devnet
rm -rf config.json
```

Download New File
```bash
wget https://fastcdn.uscloudmedia.com/transformers/test/ttfsc_0.1.0_2f1a297_devnet
chmod 755 ttfsc_0.1.0_2f1a297_devnet
```
Run Node again 
```bash
cd testnet
./ttfsc_0.1.0_2f1a297_devnet
```
Make your TFSC service on Background 
```bash
cd testnet
screen -dmS tfsc1 bash -c './ttfsc_0.1.0_2f1a297_devnet'
```
To back your screen, to close without terminating `CTRL+A+D`
```bash
screen -x tfsc1 
```
## 2. **Download TTFSC FILE _old file_**
```bash
mkdir testnet
cd testnet
wget https://fastcdn.uscloudmedia.com/transformers/test/ttfsc_0.0.1_devnet
chmod +x ttfsc_0.0.1_devnet
```
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

## **Download and edit config.toml with your own IP, you will find 2 text CHANGE WITH YOUR IP** 
 
 **Remove old file and Download new json**
```bash
cd testnet
rm -rf config.json
wget https://raw.githubusercontent.com/fatalbar/testnet-manual/main/config.json
```
 **Please Edit your Config with your own IP, please follow step with command**
```bash
nano config.json
```
![Screenshot_4](https://user-images.githubusercontent.com/81378817/178102969-9f3f472c-1abc-4cfa-8f30-e94dcd7e3d62.jpg)


_You only need to configure the external network IP, the IP field. The corresponding open port shall be port 41516 and port 41517,._

After you change with your IP you can close nano with
`CTRL+X` then y and ENTER

![Screenshot_6](https://user-images.githubusercontent.com/81378817/178103730-13e05637-5004-47d9-a46d-210b65314ce5.jpg)

_NOTICE:_
_The private key in the cert must not be lost, please backup to your pc, you can find private key directory in `root/testnet/cert/file_your_Private_Key`._

## **Run node follow this command**
```bash
cd testnet
./ttfsc_0.0.1_devnet -m
```
you will see menu, `CTRL+A+D` to make service on background you need install screen
```bash
apt install screen
```
then Re Run your NODE
```bash
screen -S tfsc
./ttfsc_0.0.1_devnet -m
```
To back your screen
```bash
screen -Rd tfsc
```
![Screenshot_7](https://user-images.githubusercontent.com/81378817/178104003-cd8e4726-9f0d-44f7-99f1-ed2c5fc2038a.jpg)

<html>
<body>
<!--StartFragment-->

Order | Menu item | Function
-- | -- | --
1 | Transaction | Transaction
2 | Stake | Stake
3 | Unstake | Disinvest
4 | Invest | Invest
5 | Disinvest | Disinvest
6 | Bonus | apply
7 | PrintAccountInfo | Print account
0 | Exit | Exit program

<!--EndFragment-->
</body>
</html>

## You have success on first STEP, WAIT for next STEP 
Thank you

