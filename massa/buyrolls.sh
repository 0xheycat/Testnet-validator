#!/bin/bash

if [ ! $PASSWORD ]; then
read -p "Input Your Client Password : " PASSWORD
echo 'export PASSWORD='\"${PASSWORD}\" >> $HOME/.bash_profile
fi
echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
. $HOME/.bash_profile

echo -e "Password Your Client: \e[1m\e[32m${PASSWORD}\e[0m"
echo '================================================='
PASSWORD=$PASSWORD
sleep 1

declare -i int_balance
declare -i lc


while true
do

if [ ! -e $HOME/massa/massa-client/massa-client ]; then
  echo "Install Massa Binary";
fi
chmod +x $HOME/massa/massa-client/massa-client
cd $HOME/massa/massa-client/
wallet_temp=$(./massa-client wallet_info -p $PASSWORD | grep Address)
wallet=${wallet_temp:9}
echo $wallet_temp;
if [ ! "$wallet" ];then
   echo "Wallet not found. Please check again";
fi

balance=$(./massa-client wallet_info -p $PASSWORD | grep "Balance: final" | awk '{ print $3 }')
echo "Balance is: " $balance;
int_balance=${balance/\.*}
if [ $int_balance -gt "99" ]; then
        resp=$(./massa-client buy_rolls $wallet $(($int_balance/100)) 0 -p $PASSWORD )
        echo $resp
fi

printf "sleep"
         for((sec=0; sec<60; sec++))
         do
                printf "."
                sleep 1
         done
         printf "\n"
 done
