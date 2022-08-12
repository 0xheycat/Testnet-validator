Open `node_key.json` and copy public key with ed552
```bash
cd .near
nano node_key.json
```
should like this
![Screenshot_143](https://user-images.githubusercontent.com/81378817/184268472-7bf3c02d-6cc8-4e50-9963-96071db231ae.jpg)


now Updating your config.json from directory `.near/config.json`

```bash
cd .near
sudo rm -rf $HOME/.near/config.json
wget https://raw.githubusercontent.com/fatalbar/testnet-manual/main/NEAR/config.json
```
open `config.json` 

```bash
nano config.json
```
replace `Public_KEY` with your Public key and `Your_IP` with your public IP VPS example= `"public_addrs": "ed25519:2G7aDGUkeV7wn2TZcuN8nu5Ufvzbr1ndovPmF8x21QPm@103.230.543.65:24567",` you can save and exit with `CTRL+X` 
![Screenshot_144](https://user-images.githubusercontent.com/81378817/184268748-03a81e0a-9afe-47db-a62c-aeabbde6b763.jpg)

Restart your NODE
```bash
sudo systemctl restart neard
journalctl -n 100 -f -u neard | ccze -A
```






