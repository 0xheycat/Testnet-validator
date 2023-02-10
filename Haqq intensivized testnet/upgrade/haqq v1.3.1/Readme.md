Upgrade Haqq v1.3.1


```bash
sudo systemctl stop haqqd
cd $HOME && rm -rf haqq
git clone https://github.com/haqq-network/haqq && cd haqq
git checkout v1.3.1
make install

haqqd version --long | head
#version: v1.3.1

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

Latest Snapshot from [KJNODES](https://services.kjnodes.com/home/testnet/haqq/snapshot) 
Stop service
```bash
sudo systemctl stop haqqd
cp $HOME/.haqqd/data/priv_validator_state.json $HOME/.haqqd/priv_validator_state.json.backup
rm -rf $HOME/.haqqd/data
```
Download Latest snapshot
```bash
curl -L https://snapshots.kjnodes.com/haqq-testnet/snapshot_latest.tar.lz4 | tar -Ilz4 -xf - -C $HOME/.haqqd
mv $HOME/.haqqd/priv_validator_state.json.backup $HOME/.haqqd/data/priv_validator_state.json
sudo systemctl start haqqd && sudo journalctl -u haqqd -f --no-hostname -o cat
```
