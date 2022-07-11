## 1.0 Official Massa Document
* [Website](https://massa.net/)
* [Github](https://github.com/massalabs/massa/)
* [Discord](https://discord.gg/massa/)

## 1.2 Hardware requirements：
* CPU: Recommend for ubuntu 20.4 , core number 4 core and above.
* Memory: 8 GB RAM
* Disk: Recommend 200 GB Disk

## 1.3 Installation Automatic (Latest version)
```bash
wget -O massa.sh https://raw.githubusercontent.com/fatalbar/testnet-manual/main/massa/massa.sh && chmod +x massa.sh && ./massa.sh
```

* Add custom port setup the firewall on your computer to allow incoming TCP connections on ports 31244 and 31245
```bash
ufw allow 31244 && ufw allow 31245
sudo ufw allow 31244/tcp
sudo ufw allow 31245/tcp
sudo ufw enable
```
* Check your firewall status
```bash
sudo ufw status
```
* Open Massa Client (please change `<passsword>` with your Client Password already ceated
```bash
cd massa/massa-client
./massa-client -p <passsword>
```

* You dont need to recover your old wallet 
![Screenshot_11](https://user-images.githubusercontent.com/81378817/178314356-aaf68fae-4b9c-4833-ba83-8e86d2ae127c.jpg)

* check your wallet Address from massa_client, copy your address then go to [Discord](https://discord.gg/massa/) to get faucet
```bash
Wallet_info
```
* Buy Rolls (Make sure your wallet have enough Balance before doing this Task) to close screen `CTRL+A+D` (proses already on background)
```bash
cd $HOME
wget -O buyrolls.sh https://raw.githubusercontent.com/fatalbar/testnet-manual/main/massa/buyrolls.sh && chmod +x buyrolls.sh && screen -xR -S buyrolls ./buyrolls.sh
```
* Register Your Node on Discord Bot , Go to this channel `Testnet-reward-Registration` and click on the uptick emoji, and the bot will send you a message. 

![Screenshot_8](https://user-images.githubusercontent.com/81378817/178301191-6f28dd97-f7d3-4dfb-8a15-d58945931f89.jpg)

* change `ADDRESS` and `DISCORD_ID` with your own ID (example `node_testnet_rewards_program_ownership_proof A1J9dqvxxxx 998476373xxxx` ) To find your Discord ID you can following this step
![Screenshot_9](https://user-images.githubusercontent.com/81378817/178303191-5074221e-7f90-4934-960a-48a0f1873e75.jpg)
* After you got your address and discord ID, you can Register testnet registration Reward
```bash
node_testnet_rewards_program_ownership_proof ADDRESS DISCORD_ID
```
* Copy the code given into the discord bot and paste your IP Address on bot, 
* register Node staking (change `<your private keys>` with your private keys)
```bash
node_add_staking_private_keys <your private keys>
```
Congratulations you have successfully registered your node.

## Additional Command
* Remove old wallet 
```bash
wallet_remove_addresses <your address>
```
* Restore Wallet from previous wallet if you already have, change `your_key` with your key already backup
```bash
wallet_add_private_keys <your_key>
```
* view your wallet
```bash
wallet_info
```
* Generate new Wallet
```bash
wallet_generate_secret_key
```
* Restore Wallet from previous wallet if you already have(change `your_key` with your key)
```bash
wallet_add_private_keys <your_key>
```
* Backup your Node
```bash
echo $HOME /massa/massa-node/config/node_privkey.key
echo $HOME /massa/massa-client/wallet.dat
```
* Check Massa Log
```bash
sudo journalctl -f -n 100 -u massad
```
* Check Massa Log
```bash
sudo tail -f /root/massa/massa-node/logs.txt
```
* Get status massa, You can close with `CTRL+C`
```bash
systemctl status massad
```
* Restart Massa
```bash
systemctl restart massad
```
* Delete Node
```bash
sudo systemctl stop massad
sudo systemctl stop massad.service
sudo systemctl disable massad.service
sudo rm /etc/systemd/system/massa* -rf
sudo rm $(which massa) -rf
sudo rm $HOME/.massa* -rf
sudo rm $HOME/massa -rf
```

## Thank you massacaptain, [Source](https://medium.com/@massacaptain/tutorial-running-node-massa-dengan-satu-command-line-32a9bc472b46)
