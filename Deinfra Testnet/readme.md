![The Power](https://user-images.githubusercontent.com/81378817/198872934-b6570df9-d5ef-4569-a161-7a84e5890fdb.jpg)

## Official Documentation
* Official Website https://thepower.io/
* Github https://github.com/thepower
* Telegram https://t.me/thepower_chat
* Document https://doc.thepower.io/

## Minimum Spec
* CPU 2
* Memory RAM 2 GB
* Hard disk	Network 20 GB, 
* SSD preferred	Minimum: 100 Mbit/s

## Register Incentive Testnet
Fill Data on Bot Telegram
```bash
https://t.me/thepowerio_bot
```
1. Start Bot
***
![Screenshot_93](https://user-images.githubusercontent.com/81378817/198873037-7c11eb8c-6464-4956-8c77-a53268e489c6.jpg)
***

2. Follow Twitter and join Telegram
***
![Screenshot_94](https://user-images.githubusercontent.com/81378817/198873060-f7ab97ca-2619-4d08-8b13-be21e4e69078.jpg)
***

3. Next Click start the Test and click All Done!
***
![Screenshot_95](https://user-images.githubusercontent.com/81378817/198873114-57570aab-5ad9-4520-a031-406d613ff490.jpg)
***

4. Install NODE
***
Install Requirement
```bash
sudo apt update -y && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && sudo apt install docker-compose
```
Clone Repository
```bash
git clone https://github.com/thepower/test_chain.git
```
```bash
cd test_chain
```
Starting NODE
```bash
docker run -d -p 44000:44000 --name testnet thepowerio/tpnode
```
5. Back to BOT again and send your Data of Node on BOT
***
```bash
http://YourIP:44000/api/node/status
```
![Screenshot_96](https://user-images.githubusercontent.com/81378817/198873346-ff09d2ad-8675-4656-8f3e-7cfce3f1674e.jpg)
***
6. Click Main Menu and start BOT Again
***
![Screenshot_97](https://user-images.githubusercontent.com/81378817/198873779-55a35f6b-f641-4c34-9ce0-c6cc19d5f149.jpg)
***
Congrats and wait Team evaluate your Submission

## Usefull Command
Check status Node
```bash
curl http://localhost:44000/api/node/status | jq
```
Check Latest Block
```bash
curl http://localhost:44000/api/block/last | jq
```
Stop NODE
```bash
docker-compose down
```
