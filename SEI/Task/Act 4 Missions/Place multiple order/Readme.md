Mission submission https://forms.gle/bWus5YH6S87LmZBY9

## Setting variable 

<html>
<body>
<!--StartFragment-->

Name | Point | Description 
-- | -- | --
 | creator/account | SEI Address | wallet address used to complete the vortex.protocol mission
price | price of Token | target price of tokens that you will sell or buy in vortex.protocol orderbook
orderType | Type your order | order type before you execute the transaction
<!--EndFragment-->
</body>
</html>

Before you start mission, your Node must cathing `false`, check your status sync
```bash
seid status 2>&1 | jq .SyncInfo
```

please replace `YOUR SEI ADDRESS` with your sei address ex seixxxxxxx
```bash
echo '{
  "body": {
    "messages": [
      {
        "@type": "/seiprotocol.seichain.dex.MsgPlaceOrders",
        "creator": "YOUR SEI ADDRESS",
        "orders": [
          {
            "id": "0",
            "status": "PLACED",
            "account": "YOUR SEI ADDRESS",
            "contractAddr": "sei1466nf3zuxpya8q9emxukd7vftaf6h4psr0a07srl5zw74zh84yjqpeheyc",
            "price": "12.050000000000000000",
            "quantity": "0.082987551867219920",
            "priceDenom": "UST2",
            "assetDenom": "ATOM",
            "orderType": "LIMIT",
            "positionDirection": "LONG",
            "data": "{\"position_effect\":\"Open\",\"leverage\":\"1\"}",
            "statusDescription": ""
          }
        ],
        "contractAddr": "sei1466nf3zuxpya8q9emxukd7vftaf6h4psr0a07srl5zw74zh84yjqpeheyc",
        "funds": [
          {
            "denom": "ust2",
            "amount": "1000000"
          }
        ]
      },
      {
        "@type": "/seiprotocol.seichain.dex.MsgPlaceOrders",
        "creator": "YOUR SEI ADDRESS",
        "orders": [
          {
            "id": "0",
            "status": "PLACED",
            "account": "YOUR SEI ADDRESS",
            "contractAddr": "sei1466nf3zuxpya8q9emxukd7vftaf6h4psr0a07srl5zw74zh84yjqpeheyc",
            "price": "25.000000000000000000",
            "quantity": "10.000000000000000000",
            "priceDenom": "UST2",
            "assetDenom": "ATOM",
            "orderType": "MARKET",
            "positionDirection": "SHORT",
            "data": "{\"position_effect\":\"Open\",\"leverage\":\"1\"}",
            "statusDescription": ""
          }
        ],
        "contractAddr": "sei1466nf3zuxpya8q9emxukd7vftaf6h4psr0a07srl5zw74zh84yjqpeheyc",
        "funds": [
          {
            "denom": "ust2",
            "amount": "10"
          }
        ]
      }
    ],
    "memo": "",
    "timeout_height": "0",
    "extension_options": [],
    "non_critical_extension_options": []
  },
  "auth_info": {
    "signer_infos": [],
    "fee": {
      "amount": [
        {
          "denom": "usei",
          "amount": "0"
        }
      ],
      "gas_limit": "0",
      "payer": "",
      "granter": ""
    }
  },
  "signatures": []
}' > $HOME/gen_tx.json
```
export data to your VPS, Please replace `SEI_ADDRESS` with your SEI address, ex seixxxxx

```bash
echo "export NUM=$(seid q account SEI_ADDRESS -o json --node https://sei-testnet-rpc.brocha.in:443 | jq -r .account_number)" >> $HOME/.bash_profile
echo "export SEQ=$(seid q account SEI_ADDRESS -o json --node https://sei-testnet-rpc.brocha.in:443 | jq -r .sequence)" >> $HOME/.bash_profile
source $HOME/.bash_profile
```
check data 
```bash
echo $NUM
echo $SEQ
```
Sign transaction
```bash
seid tx sign $HOME/gen_tx.json -s $SEQ -a $NUM --offline \
--from wallet --chain-id atlantic-1 \
--output-document $HOME/txs.json
seid tx broadcast --node https://sei-testnet-rpc.brocha.in:443 $HOME/txs.json
```
![Screenshot_130](https://user-images.githubusercontent.com/81378817/200892375-1c7abc58-eaa9-4207-a544-5bab681ab6a2.jpg)

check your transaction on explorer, replace xx with txhash
```bash
https://sei.explorers.guru/transaction/xx 
```

fill form submission https://forms.gle/bWus5YH6S87LmZBY9

Troubleshooting

1. account sequence mismatch, expected 9082, got 9081: incorrect account sequence , what should i do ?
 your account sequence has changed, so you need to update with new sequence
 
```bash
echo "export NUM=$(seid q account SEI_ADDRESS -o json --node https://sei-testnet-rpc.brocha.in:443 | jq -r .account_number)" >> $HOME/.bash_profile
echo "export SEQ=$(seid q account SEI_ADDRESS -o json --node https://sei-testnet-rpc.brocha.in:443 | jq -r .sequence)" >> $HOME/.bash_profile
source $HOME/.bash_profile
```

Sign transaction
```bash
seid tx sign $HOME/gen_tx.json -s $SEQ -a $NUM --offline \
--from wallet --chain-id atlantic-1 \
--output-document $HOME/txs.json
seid tx broadcast --node https://sei-testnet-rpc.brocha.in:443 $HOME/txs.json
```

Still confused please following video Guide https://youtu.be/Maq2aEYmKxU
Thank you
