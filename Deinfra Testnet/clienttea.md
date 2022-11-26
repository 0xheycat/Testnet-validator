
## Official Meson Documentation
* Official Website https://thepower.io/
* Github https://github.com/thepower
* Telegram https://t.me/thepower_chat
* Document https://doc.thepower.io/
 
## Hardware minimum requirements
<html>
<body>
<!--StartFragment-->

CPU cores | Memory | Hard disk | Network
-- | -- | -- | --
4 | 4 GB or more | Minimum: 40 GB, SSD preferred | 100 Mbit/s

<!--EndFragment-->
</body>
</html>

## Software 
<html>
<body>
<!--StartFragment-->

OS | Erlang version | Eshell version | Docker version | Server
-- | -- | -- | -- | --
Ubuntu 22.04 | 24.3 | 10.4 | latest (20.10.18 as of September 2022) | Virtual machine

<!--EndFragment-->
</body>
</html>

## NOTE
**Before you Running Ceremony Tea Client ,make sure you have passed Tesnet Phase 1, if you late you can Join Phase 2 soon**

[Register phase 1](https://github.com/fatalbar/Testnet-validator/blob/main/Deinfra%20Testnet/Register%20PHASE%201.md) CLOSED

## Open port 1080, 1443, 1800
open port using script from [secord0](https://github.com/SecorD0) thank you [secord0](https://github.com/SecorD0)
```bash
. <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/ports_opening.sh) \1080 1443 1800 443
```
or using manual 
```bash
ufw allow 1080 && ufw allow 1443 && ufw allow 1800
ufw allow 22
sudo ufw allow 1080/tcp
sudo ufw allow 1443/tcp
sudo ufw allow 1800/tcp
sudo ufw allow 443/tcp
sudo ufw enable
```
check status UFW
```bash
sudo ufw status verbose
```
# Install requirement
```bash
sudo apt-get update -y && sudo apt-get install wget -y
```
install erlang
```bash
apt -y install erlang-base erlang-public-key erlang-ssl
```
> Note
> You need to install erlang-public key and erlang-ssl. Otherwise, Erlang will not operate properly!

## Install Tea Ceremony client
Get the Tea Ceremony client by running the following command:
```bash
wget https://tea.thepower.io/teaclient
```
Change the teaclient file mode to executable by running the following command:
```bash
chmod +x teaclient
```

## Running Tea Ceremony client
## How to get ceremony Token ID ?
* Back to BOT 
 https://t.me/thepowerio_bot

![Screenshot_172](https://user-images.githubusercontent.com/81378817/204104026-07253862-1149-4411-a3b0-00cd2ff82c7a.jpg)

* Copy ceremony Token ID and runing your client Running Ceremony Tea Client

![Screenshot_173](https://user-images.githubusercontent.com/81378817/204104073-5056a848-b3dd-4e01-877a-3d7168a3ef93.jpg)

To start the client, run the following command:
```bash
./teaclient -n nickname aaaaa.bbbbb
```
where

* teaclient — Tea Ceremony client,
* nickname - The name of your node. Maximum 10 characters.
* aaaaa.bbbbb — Tea Ceremony Token, you've got from the Tea Ceremony bot.

The token (aaaaa.bbbbb) consists of two parts:

* aaaaa — chain token. It is common for all nodes in the chain, and
* bbbbb — personal token. It can't be expired until it is used, but you can use it only once.
If you start the Tea Ceremony with the public part of the token, you will be able to check the ports availability.

After you have started the client, wait for other participants. Please, DON'T turn off the Tea Ceremony client for 24 hours.


