#!/bin/bash

source .env
coldkey="test-coldkey"
hotkey="test-hotkey"

wallets=$(btcli wallet list)

#if ! [[ $wallets == *coldkey* ]]; then
#  echo "Regenerating coldkey wallet"
#  yes n | printf $COLDKEY_PASSWORD | printf $COLDKEY_PASSWORD | btcli wallet regen_coldkey --wallet.name $WALLET_NAME --mnemonic $COLDKEY_MNEMONIC --password $COLDKEY_PASSWORD
#fi


if ! [[ $wallets == *hotkey* ]]; then
  echo "Regenerating hotkey wallet"
  yes n | btcli wallet regen_hotkey --wallet.name $WALLET_NAME --wallet.hotkey $HOTKEY_NAME --mnemonic $HOTKEY_MNEMONIC
fi
