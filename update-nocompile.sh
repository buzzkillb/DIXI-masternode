#!/bin/bash

echo "Updating Dixicoin Wallet"
dixicoind stop
echo "Downloading Dixicoin Wallet"
rm -rf dixicoin
wget wget https://github.com/Dixicoin-DXC/Dixicoin/releases/download/untagged-9b6fe8bd210320b07944/dixi-4.3.0-aarch64-linux-gnu.zip
unzip dixi-4.3.0-aarch64-linux-gnu.zip -d dixicoin
mv dixicoin/dixicoind /usr/local/bin/dixicoind
mv dixicoin/dixicoin-cli /usr/local/bin/dixicoin-cli
chmod 755 /usr/local/bin/dixicoind
chmod 755 /usr/local/bin/dixicoin-cli
rm dixi-4.3.0-aarch64-linux-gnu.zip

echo "Starting Updated Dixicoin Daemon"
sudo dixicoind --daemon
