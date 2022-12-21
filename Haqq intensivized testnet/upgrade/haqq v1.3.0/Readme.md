Upgrade Haqq v1.3.0


```bash
sudo systemctl stop haqqd
cd $HOME && rm -rf haqq
git clone https://github.com/haqq-network/haqq && cd haqq
git checkout v1.3.0
make install

haqqd version --long | head
#version: v1.3.0
#commit: 39b4dcb706e72c187fc23ec6dddcfed20c79bc9d

sudo systemctl restart haqqd

curl -s http://127.0.0.1:26657/consensus_state | jq '.result.round_state.height_vote_set[0].prevotes_bit_array'

sudo journalctl -u haqqd -f -o cat
```


LIVE seed and peers

```bash
seeds="e711b6631c3e5bb2f6c389cbc5d422912b05316b@rpc.haqq.ppnv.space:21256"
peers="48a2a7762a579d25bca95b0a3548b714238dd60b@rpc.haqq.ppnv.space:20656"
sed -i -e 's|^seeds *=.*|seeds = "'$seeds'"|; s|^persistent_peers *=.*|persistent_peers = "'$peers'"|' $HOME/.haqqd/config/config.toml
```
