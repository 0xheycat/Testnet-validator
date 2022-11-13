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

for (( ;; )); do
echo -e "\033[0;32mCollecting commission rewards!\033[0m"
commision=$(celestia-appd tx distribution withdraw-rewards $CELESTIA_VALOPER_ADDRESS --from=$WALLET --commission --chain-id=$CELESTIA_CHAIN_ID --node http://94.130.239.162:30057 -y | grep "txhash" | awk '{ print $0 }')
echo "CLAIMED! " $commision;
echo -e "\033[0;32mWaiting 30 seconds before withdraw all reward\033[0m"
sleep 30

echo -e "\033[0;32mCollecting reward from all validator!\033[0m"
reward=$(celestia-appd tx distribution withdraw-all-rewards --from=$WALLET --chain-id=$CELESTIA_CHAIN_ID --node http://94.130.239.162:30057 -y | grep "txhash" | awk '{ print $0 }')
echo "CLAIMED! " $reward;
echo -e "\033[0;32mWaiting 30 seconds before check your balance\033[0m"
sleep 30

balance=$(celestia-appd query bank balances $CELESTIA_WALLET_ADDRESS --node http://94.130.239.162:30057 | grep amount | awk '{split($0,a,"\""); print a[2]}')
final_balance=$balance"utia"
echo -e "Your total balance: \033[0;32m$final_balance\033[0m"

echo -e "\033[0;32mDelegating to your validator!\033[0m"
status=$(celestia-appd tx staking delegate $CELESTIA_VALOPER_ADDRESS $final_balance --from=$WALLET --chain-id=$CELESTIA_CHAIN_ID --node http://94.130.239.162:30057 -y | grep "txhash" | awk '{ print $0 }')
echo -e "$final_balance STAKED! \033[0;32m$status restart 300 second\033[0m";
sleep 10

done
