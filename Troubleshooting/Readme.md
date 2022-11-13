## Get Error when adding/restore wallet from NODE `Error: No such interface “org.freedesktop.DBus.Properties” on object at path /`

![Screenshot_133](https://user-images.githubusercontent.com/81378817/201504090-7a011812-5a4f-4581-842b-b8de04a81bc4.jpg)

service Node isn't pointing to the correct file,

in case im tried to check rebusd service, you can replace `rebusd` with other service like `seid` `haqqd` which NODE used
```bash
which rebusd
```
![Screenshot_134](https://user-images.githubusercontent.com/81378817/201504146-ab8b255d-1036-416d-b5d4-d1eb5ee8ce98.jpg)

```bash
rebusd config keyring-backend file
```
now try again to adding/restore your wallet

![Screenshot_135](https://user-images.githubusercontent.com/81378817/201504238-36d4531d-566a-41ea-b0ca-956bd205cdce.jpg)


Congrats 
