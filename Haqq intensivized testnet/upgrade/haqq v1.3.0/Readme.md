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
```bash
