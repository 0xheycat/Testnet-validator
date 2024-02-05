![Screenshot_103](https://github.com/fatalbar/Testnet-validator/assets/81378817/b39f85cb-755d-4118-918f-11e5f647c674)
## Official Website
* Website [Link](https://bevm.io) 
* Form Registration BEVM Incentive Testnet Fullnode  [Link](https://docs.google.com/forms/u/0/d/e/1FAIpQLSfaD7J97Z3T79TF-UaBT6xj9jiGAXrAqb56QmqY-HrEsv4AOw/formResponse)
* Discord [link](https://discord.gg/MbZW655p4e) 
## System Requirement
![Screenshot_101](https://github.com/fatalbar/Testnet-validator/assets/81378817/34fd3b51-d5db-4ff5-83a5-a84b4eebd8a9)

# Update
* 🌅 Update wss configuration from new Phase `wss://telemetry-testnet.bevm.io/submit 1` 5 Feb 2024
* 🌅 Build v0.1.2

# Install Docker and Dependencies
install Docker, Docker Compose, and dependencies you can follow these steps:

Step 1: Update System Packages
Start by updating the system packages to their latest versions.

```
sudo apt update
sudo apt upgrade
```

Step 2: Install Docker
Install Docker using the following commands:

```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker your_username
```

Replace `your_username` with your VPS username.

Step 3: Install Docker Compose
Install Docker Compose using the following commands:

```
sudo apt install docker-compose
```

Step 4: Verify Installation
Verify that Docker and Docker Compose have been installed correctly by checking their versions:

```
docker --version
docker-compose --version
```

Step 5: Manage Docker as a Non-Root User (Optional)
If you want to run Docker commands without sudo, follow these steps:

```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

Step 6: Configure Docker to Start on Boot (Optional)
Configure Docker to start on system boot using the following command:

```
sudo systemctl enable docker.service
```
# Build BEVM 

### Update latest version
* Stop old service 
```bash
docker ps -a
```
find (find BTC 2 service)
```bash
docker kill `container id`
```
```bash
docker rm `container id`
```
remove old dir container
```bash
sudo rm -rf /var/lib/node_bevm_test_storage
```

Make path and directory:
```bash
cd /var/lib
mkdir node_bevm_test_storage
```

### Start Docker :
```bash
sudo docker pull btclayer2/bevm:testnet-v0.1.2
```
![Screenshot_16](https://github.com/fatalbar/Testnet-validator/assets/81378817/930ff5d3-bbd7-41bd-b54a-14f210d6065b)

### Running and copy Node Identity 
* `metamask-address` with Your Metamask Address example `0x0987383787843`
```bash
sudo docker run -d -v /var/lib/node_bevm_test_storage:/root/.local/share/bevm btclayer2/bevm:testnet-v0.1.2 bevm "--chain=testnet" "--name=metamask-address" "--pruning=archive" --telemetry-url "wss://telemetry-testnet.bevm.io/submit 1"
```
![Screenshot_18](https://github.com/fatalbar/Testnet-validator/assets/81378817/2cc60e54-3f2a-4d13-9a0a-d861b57af7e5)

it will generate Tx Hash and Save it

* check the logs 
```bash
docker ps -a
```
![Screenshot_19](https://github.com/fatalbar/Testnet-validator/assets/81378817/606109d4-657d-4b90-9b34-b3d72610515b)


Replace `container id`
```bash
docker logs -f <container ID>
```
Do Quick, Scroll UP until you found `Local Up Identity` and save it, something like this
![Screenshot_21](https://github.com/fatalbar/Testnet-validator/assets/81378817/ff22acd1-7e01-4398-b0d3-2f98145db413)



Ok 
### prepare P2p (OPTIONAL)

* Open endpoints with firewall:
```bash
sudo iptables -A INPUT -p tcp --dport 30333 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 30333 -j ACCEPT
```

### Run a docker container: 
please replace following 
* `metamask-address` with BEVM from Metamask example `0x0987383787843`
* `NodePublicKey` with node identity from logs, 
  ![Screenshot_102](https://github.com/fatalbar/Testnet-validator/assets/81378817/a0edcd61-39ea-44f9-b5af-60affd3a5be3)
  
* `YourIP`  ip address from your VPS

```bash
sudo docker run -d -v /var/lib/node_bevm_test_storage:/root/.local/share/bevm btclayer2/bevm:testnet-v0.1.2 bevm "--chain=testnet" "--name=metamask-address" "--pruning=archive" --telemetry-url "wss://telemetry-testnet.bevm.io/submit 1" --bootnodes /ip4/YourIP/tcp/30333/ws/p2p/NodePublicKey
```
It will generate a Tx hash, save it for furture use.

🎉 Congrats your node is up and running.

## Command 
* Check the logs
```bash
docker ps -a
```
then, replacing `container id` below:
```bash
docker logs -f <container ID>
```

* Stop Docker
```bash 
docker stop <container ID>
```

do you want share coffee ?
sure i also receiving coffe `0x5568d637aEfE29D939a724f64e0515B238353Bfb`

If you have any issue with my configuration please make PR Thank you , 2024 Is Yours 
