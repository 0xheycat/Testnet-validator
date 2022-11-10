## Simple configure boostrap file 
```bash
cd massa/massa-node/base_config/
rm -rf config.toml
wget -O config.toml https://raw.githubusercontent.com/fatalbar/Testnet-validator/main/massa/Boostrap/config.toml && chmod +x config.toml
systemctl status massad
```
