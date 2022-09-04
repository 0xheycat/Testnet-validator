
Create genx
```bash
haqqd gentx wallet 10000000000000000000aISLM \
--chain-id=haqq_54211-2 \
--moniker="Your Validator name" \
--commission-max-change-rate 0.05 \
--commission-max-rate 0.20 \
--commission-rate 0.05 \
--website="your_website" \
--security-contact="your_email" \
--identity="<your_keybase_id>" \
--details="your_validator_description>"
```

After executing command, . Submit a pull request (gentx folder) with the given gentx

File Genesis transaction written to "/.haqqd/config/gentx/gentx-xxx.json"
