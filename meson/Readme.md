
![meson-center b4d0c9b7](https://user-images.githubusercontent.com/81378817/202838733-c4aaba12-c587-48b2-b784-1b988d099f14.png)

## Official Meson Documentation
* Doc https://docs.meson.network/
* Github https://github.com/daqnext
* Discord https://discord.com/invite/z6YfSHDkmS
* Register https://dashboard.meson.network/register
 
## Hardware minimum requirements
* CPU 4 cores (Intel Xeon Skylake or newer)
* RAM 4GB RAM
* Storage 100 GB

# Install requirement
```bash
sudo apt-get update -y && sudo apt-get install wget -y
```
# Install Meson
1. For linux amdx64
```bash
wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.18/meson_cdn-linux-amd64.tar.gz' && tar -zxf meson_cdn-linux-amd64.tar.gz && rm -f meson_cdn-linux-amd64.tar.gz && cd ./meson_cdn-linux-amd64 && sudo ./service install meson_cdn
```
2. For Linux arm
```bash
wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.18/meson_cdn-linux-arm64.tar.gz' && tar -zxf meson_cdn-linux-arm64.tar.gz && rm -f meson_cdn-linux-arm64.tar.gz && cd ./meson_cdn-linux-arm64 && sudo ./service install meson_cdn
```
# set token and config
Please replace 'your token' with your own 'token ID', find your Token ID there https://dashboard.meson.network/user_node
```bash
sudo ./meson_cdn config set --token=your token --https_port=443 --cache.size=30
```
example
```bash
sudo ./meson_cdn config set --token=dnqtpthzeyghgzkxwnltpqnw --https_port=443 --cache.size=30
```
Parameter list
<html>
<body>
<!--StartFragment-->

Parameter | Description 
-- | -- 
 | -token=your token | you can find out your token in nodes page
-https_port=443 | default is 443, support for custom server ports
-cache.size=30 | minimum: 20G, default: 30G
-cache.folder=xxxx | string, cache folder path, could be an absolute path
<!--EndFragment-->
</body>
</html>

## Running NODE
start service
```bash
sudo ./service start meson_cdn
```
After 2-3 minutes, you will have a new terminal record at terminals open in new node .
![Screenshot_153](https://user-images.githubusercontent.com/81378817/202838460-08d897a5-4f1d-4aca-9514-5555adc05800.jpg)

check status NODE
```bash
sudo ./service status meson_cdn
```
# Useful Command
install node
```bash
sudo ./service install meson_cdn 
```      
start node       
```bash
sudo ./service start meson_cdn               
```
check node running status
```bash
sudo ./service status meson_cdn 
```
stop node
```bash            
sudo ./service stop meson_cdn 
```
remove node
```bash               
sudo ./service remove meson_cdn   
```  
restart node     
```bash     
sudo ./service restart meson_cdn    
```  
check logs       
```bash
sudo ./meson_cdn log   
```
check help
```bash                       
./meson_cdn -h    
```       
Remove Node
```bash 
sudo ./service stop meson_cdn && sudo ./service remove meson_cdn
```                    

Thank you
