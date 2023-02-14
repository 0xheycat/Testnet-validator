## Install requirements
```bash
apt install git
```

Install Erlang
```bash
curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl
```
> Note
> If you already have Erlang installed on your machine, Please deleting it before the new installation, using the following command:
```bash
apt purge erlang*
```
execute script
```bash
chmod a+x kerl
```
create erlang directory
```bash
mkdir erlang
```
Update the list of Erlang 
```bash
./kerl update releases
```

Build Erlang the release 24.3 
```bash
./kerl build 24.3
```

After installation is complete, you will see the following message in the console:
```bash
Erlang/OTP 24.3 (24.3) has been successfully built
```

Install Erlang 
```bash
./kerl install 24.3 /opt/erlang
```
activating Erlang 
```bash
source /opt/erlang/activate
```
next install [teaclient](https://github.com/fatalbar/Testnet-validator/blob/main/Deinfra%20Testnet/clienttea.md)
