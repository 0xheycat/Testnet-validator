## Auto script NODE
function of script
1. autmatic claim all reward from validator node
2. autmatic Claim reward with commision
3. autmatic Redelegate reward 

## INSTALLATION
before you running this script, make sure you already install NODE on your local system
```bash
cd $HOME
wget -O autoclaim%26redelegate.sh https://raw.githubusercontent.com/fatalbar/Testnet-validator/main/Haqq%20intensivized%20testnet/Tool/autoclaim%26redelegate.sh && chmod +x autoclaim%26redelegate.sh
```
```bash
screen -xR -S autoclaim
```
```bash
bash autoclaim%26redelegate.sh
```
Please dont press `CTRL+C` it will close your service, you can press `CTRL+A+D` ,if you want to check status of your script just following command below
```bash
screen -x autoclaim
```
