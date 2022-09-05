> ![Screenshot_220](https://user-images.githubusercontent.com/81378817/188493374-efc10523-0a3e-4e87-b7d8-a7b1a7008f15.jpg)

## Official Documentation
* https://docs.minima.global/
## Hardware minimum requirements
* CPU 2-4 cores 
* RAM 4-8GB RAM
* Storage 100 GB
## Installation

```bash
wget -O minima_setup.sh https://raw.githubusercontent.com/minima-global/Minima/master/scripts/minima_setup.sh && chmod +x minima_setup.sh && sudo ./minima_setup.sh -p 9001 -r 9002
```
> Wait for Minima to start, this can take up to 30 minutes and Minima will restart during the process
> When you see the log message below, Minima has started and synced to the chain. `[+] Connected to the blockchain Initial Block Download received`.
> Hold `ctrl+c` together to exit the logs, Minima will continue to run in the background

Running multiple nodes on one server ?
> You can specify different port numbers on the end to do this, for example using port 9121-9125:
```bash
wget -O minima_setup.sh https://raw.githubusercontent.com/minima-global/Minima/master/scripts/minima_setup.sh && chmod +x minima_setup.sh && sudo ./minima_setup.sh -p 9121 -r 9122
```
## Register Incentive Program account to receive rewards

1. Register at [Minima](https://incentive.minima.global/account/register?inviteCode=FDVMDQMT) 
2. After create account, Go to the `Incentive ID page` and copy your `Incentive ID` 
>  ![Screenshot_222](https://user-images.githubusercontent.com/81378817/188495218-a6d0b25e-07ac-482b-aa94-a6377a0d85bd.jpg)
>  ![Screenshot_221](https://user-images.githubusercontent.com/81378817/188495227-4eaf1986-c5a3-4393-bcc4-50fb293eb2bc.jpg)
3. Once the Minima is running, enter the following command from your server to connect your Incentive ID to your node
```bash
curl 127.0.0.1:9002/incentivecash%20uid:xxx-xxx-xxx-xxx-xxx
```
> replace the `xxx` with your own Incentive ID

Example:
```bash
curl 127.0.0.1:9002/incentivecash%20uid:00F3E50D-5A52-444B-8F1A-0DA72D6CAA84
```
> You should receive a return status of `true` and see your Reward balances

 **Congrats Your Incentive Program account is now connected to your node**
To check your Rewards 
```bash
curl 127.0.0.1:9002/incentivecash | jq
```
 ###  REWARDS
> For every day your node is connected to the network, you will receive 1 Reward within the next 24 hours.

## Useful Commands
shows the status of Minima
```bash
curl 127.0.0.1:9002/status | jq
```
shows your incentive cash balance
```bash
curl 127.0.0.1:9002/incentivecash | jq
```
shows the full list of commands
```bash
curl 127.0.0.1:9002/help | jq
```

show log
```bash
journalctl -u minima_9001 -f
```
Check the status of the Minima background service
```bash
sudo systemctl status minima_9001
```
Stop Node
```bash
sudo systemctl stop minima_9001
```
Restart Node
```bash
sudo systemctl restart minima_9001
```
