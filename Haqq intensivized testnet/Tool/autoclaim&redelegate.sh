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
if [ ! $NODE ]; then
read -p "Input your Validator name: " NODE
echo 'export NODE='\"${NODE}\" >> $HOME/.bash_profile
if [ ! $ADDRESS ]; then
read -p "Input your wallet address: " ADDRESS
echo 'export ADDRESS='\"${ADDRESS}\" >> $HOME/.bash_profile
if [ ! $VALOPER ]; then
read -p "Input your Validator address : " VALOPER
echo 'export VALOPER='\"${VALOPER}\" >> $HOME/.bash_profile
if [ ! $CHAIN ]; then
read -p "Input your Chain ID,ex chain for HAQQ is haqq_54211-2 : " CHAIN
echo 'export CHAIN='\"${CHAIN}\" >> $HOME/.bash_profile
if [ ! $TOKEN ]; then
read -p "Input your Token name,ex= usei for SEI,aISLM for HAQQ : " TOKEN
echo 'export TOKEN='\"${TOKEN}\" >> $HOME/.bash_profile
if [ ! $SERVICE ]; then
read -p "Input Service NAME your NODE Testnet,ex haqqd,seid,mund,masad : " SERVICE
echo 'export SERVICE='\"${SERVICE}\" >> $HOME/.bash_profile

fi
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

#Instalation
if [ ! -e $SERVICE status 2>&1 | jq .SyncInfo ]; then
  echo "Your NODE is Running Well";
fi
chmod +x $HOME/autoclaim%26redelegate.sh
cd $HOME
claim=$SERVICE tx distribution withdraw-all-rewards --from=$ADDRESS --chain-id=$CHAIN -y
if [ $claim ]; then
        resp=$($SERVICE tx distribution withdraw-all-rewards --from=$ADDRESS --chain-id=$CHAIN -y )
        echo $resp
fi
cd $HOME
commision=$SERVICE tx distribution withdraw-rewards $VALOPER --from=$ADDRESS --commission --chain-id=$CHAIN -y
if [ $commision ]; then
        resp2=$($SERVICE tx distribution withdraw-all-rewards --from=$ADDRESS --chain-id=$CHAIN -y )
        echo $resp2
fi
cd $HOME
delegate=$SERVICE tx staking delegate $VALOPER 500000000000 $TOKEN --from=$ADDRESS --chain-id=$CHAIN -y
if [ $delegate ]; then
        resp3=$($SERVICE tx staking delegate $VALOPER 500000000000 $TOKEN --from=$ADDRESS --chain-id=$CHAIN -y )
        echo $resp3
fi

printf "sleep"
         for((sec=0; sec<60; sec++))
         do
                printf "."
                sleep 1
         done
         printf "\n"
done
echo '=============== install FINISHED ==================='
echo -e 'To close logs: \e[1m\e[32mpress CTRL+A+D\e[0m' && sleep 1
