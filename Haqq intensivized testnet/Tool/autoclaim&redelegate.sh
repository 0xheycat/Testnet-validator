#!/bin/bash
echo "================================================================================"
echo -e "\033[0;35m"
echo " ' ███╗░░░███╗███████╗░█████╗░░██╗░░░░░░░██╗██████╗░░█████╗░██████╗░███████╗██████╗░ ";
echo " ' ████╗░████║██╔════╝██╔══██╗░██║░░██╗░░██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗ ";
echo " ' ██╔████╔██║█████╗░░██║░░██║░╚██╗████╗██╔╝██████╦╝██║░░██║██████╔╝█████╗░░██║░░██║ ";
echo " ' ██║╚██╔╝██║██╔══╝░░██║░░██║░░████╔═████║░██╔══██╗██║░░██║██╔══██╗██╔══╝░░██║░░██║ ";
echo " ' ██║░╚═╝░██║███████╗╚█████╔╝░░╚██╔╝░╚██╔╝░██████╦╝╚█████╔╝██║░░██║███████╗██████╔╝ ";
echo " ' ╚═╝░░░░░╚═╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝░░╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═════╝░ ";
echo -e "\e[0m"
echo "================================================================================="
sleep 2

# set your Automatic claim staking reward
read -p "Input your Validator name: " NODE
read -p "Input your wallet address: " ADDRESS
read -p "Input your Validator address : " VALOPER
read -p "Input your Chain ID,ex chain for HAQQ is haqq_54211-2 : " CHAIN
read -p "Input your Token name,ex usei for SEI,aISLM for HAQQ : " TOKEN
read -p "Input Service NAME your NODE Testnet,ex haqqd,seid,mund,masad : " SERVICE
echo 'export NODE='\"${NODE}\" >> $HOME/.bash_profile
echo 'export SERVICE='\"${SERVICE}\" >> $HOME/.bash_profile
echo 'export TOKEN='\"${TOKEN}\" >> $HOME/.bash_profile
echo 'export ADDRESS='\"${ADDRESS}\" >> $HOME/.bash_profile
echo 'export VALOPER='\"${VALOPER}\" >> $HOME/.bash_profile
echo 'export CHAIN='\"${CHAIN}\" >> $HOME/.bash_profile

echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
. $HOME/.bash_profile

echo '================================================='
echo -e "Your Validator Name: \e[1m\e[32m$VALOPER\e[0m"
echo -e "Your Wallet Address: \e[1m\e[32m$ADDRESS\e[0m"
echo -e "Your Token Name: \e[1m\e[32m$ADDRESS\e[0m"
echo -e "Your Validator Address: \e[1m\e[32m$VALOPER\e[0m"
echo -e "Your chain name: \e[1m\e[32m$CHAIN\e[0m"
echo -e "Your Service NODE: \e[1m\e[32m$SERVICE\e[0m"
echo '================================================='
sleep 1

declare -i status
declare -i lc

while true
do

if [ ! -e $HOME/ ]; then
  echo "Wallet found";
fi
cd $HOME
wallet_temp=$($SERVICE keys show wallet)
wallet=${wallet_temp:9}
echo $wallet_temp;
if [ ! "$wallet" ];then
   echo "Wallet not found. Please check again";
fi
commision=$($SERVICE tx distribution withdraw-rewards $VALOPER --from=$ADDRESS --commission --chain-id=$CHAIN -y | grep "txhash" | awk '{ print $3 }')
echo "commision is: " $commision;
sleep 1

reward=$($SERVICE tx distribution withdraw-all-rewards --from=$ADDRESS --chain-id=$CHAIN -y | grep "txhash" | awk '{ print $3 }')
echo "reward is: " $reward;
sleep 1

balance=$($SERVICE query bank balances $ADDRESS | grep "amount" | awk '{ print $3 }')
echo "Balance is: " $balance;
status=$($SERVICE tx staking delegate $VALOPER 1000$TOKEN --from=$ADDRESS --chain-id=$CHAIN -y | grep "txhash" | awk '{ print $3 }')
echo "txhash is: " $status;
sleep 1

printf "sleep"
         for((sec=0; sec<60; sec++))
         do
                printf "."
                sleep 1
         done
         printf "\n"
 done
