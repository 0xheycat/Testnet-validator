![Screenshot_136](https://user-images.githubusercontent.com/81378817/201508945-8b2f80f9-aa59-4c62-b4a5-33f30a685ec7.jpg)

## Simple script  
what Feature 
1. Claim reward from all validator
2. Claim Commission reward from validator
3. autocheck balance
4. restake reward to your Validator

## INSTALLATION
before you running this script, make sure you already install NODE on your local system and `false`
```bash
cd $HOME
wget -O autodelegate.sh https://raw.githubusercontent.com/fatalbar/Testnet-validator/main/celestia/autodelegate/autodelegate.sh && chmod +x autodelegate.sh
```
```bash
screen -xR -S celestia
```
```bash
bash autodelegate.sh
```
Please dont press `CTRL+C` it will close your service, you can press `CTRL+A+D` ,if you want to check status of your script just following command below
```bash
screen -x celestia
```
