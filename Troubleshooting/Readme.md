## 1. Get Error when adding/restore wallet from NODE `Error: No such interface “org.freedesktop.DBus.Properties” on object at path /`

![Screenshot_133](https://user-images.githubusercontent.com/81378817/201504090-7a011812-5a4f-4581-842b-b8de04a81bc4.jpg)

service Node isn't pointing to the correct file,

in case im tried to check rebusd service, you can replace `rebusd` with other service like `seid` `haqqd` `celestiad` which NODE used
```bash
which rebusd
```
![Screenshot_134](https://user-images.githubusercontent.com/81378817/201504146-ab8b255d-1036-416d-b5d4-d1eb5ee8ce98.jpg)

```bash
rebusd config keyring-backend test
```
now try again to adding/restore your wallet

![Screenshot_135](https://user-images.githubusercontent.com/81378817/201504238-36d4531d-566a-41ea-b0ca-956bd205cdce.jpg)


Congrats 
You can also use it when you try to check the balance but doesn't appear, or your wallet address not appear
thank you 

## 2. Error: rpc error: code = Unknown desc = rpc error: code = Unknown desc = account sequence mismatch, expected 2, got 1: incorrect account sequence [cosmos/cosmos-sdk@v0.45.10-0.20221014225501-18eaf090ca1c/x/auth/ante/sigverify.go:265]

![Screenshot_151](https://user-images.githubusercontent.com/81378817/202712718-c8aded26-d7a7-459b-8e44-36cbe6de887a.jpg)

usually happend when your gas prices on `app.toml` not correct, try to replace your Default setting with new value depend NODE used ,Default Dir `app.toml`  `$HOME/.defund/config/app.toml` please replace with your NODE running 
```bash
sed -i 's|^minimum-gas-prices *=.*|minimum-gas-prices = "0.0001ufetf"|g' $HOME/.defund/config/app.toml
```
then try to execute new transaction 
![Screenshot_152](https://user-images.githubusercontent.com/81378817/202713966-abb5c1f2-dafe-4697-a3e0-6179732bf721.jpg)

thank you
