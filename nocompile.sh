#!/bin/bash

echo "Updating linux packages"
sudo apt-get update && apt-get upgrade -y

echo "Intalling screen"
apt install screen -y

echo "Installing git"
apt install git -y

echo "Installing curl"
apt install curl -y

echo "Intalling fail2ban"
sudo apt install fail2ban -y

echo "Installing Firewall"
sudo apt install ufw -y
ufw default allow outgoing
ufw default deny incoming
ufw allow ssh/tcp
ufw limit ssh/tcp
ufw allow 61151/tcp
ufw allow 61150/tcp
ufw logging on
ufw --force enable

echo "Installing PWGEN"
apt-get install -y pwgen

echo "Installing 2G Swapfile"
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

echo "Installing Dependencies"
sudo apt-get install -y git nano unzip build-essential libzmq5 libssl-dev libdb++-dev libboost-all-dev libcrypto++-dev libqrencode-dev libminiupnpc-dev libgmp-dev libgmp3-dev autoconf autogen automake libtool
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

echo "Downloading Dixicoin Wallet"
wget wget https://github.com/Dixicoin-DXC/Dixicoin/releases/download/untagged-9b6fe8bd210320b07944/dixi-4.3.0-aarch64-linux-gnu.zip
unzip dixi-4.3.0-aarch64-linux-gnu.zip -d dixicoin
mv dixicoin/dixicoind /usr/local/bin/dixicoind
mv dixicoin/dixicoin-cli /usr/local/bin/dixicoin-cli
chmod 755 /usr/local/bin/dixicoind
chmod 755 /usr/local/bin/dixicoin-cli

echo "Populate dixicoin.conf"
sudo mkdir  /root/.dixicoin
    # Get VPS IP Address
    VPSIP=$(curl ipinfo.io/ip)
    # create rpc user and password
    rpcuser=$(openssl rand -base64 24)
    # create rpc password
    rpcpassword=$(openssl rand -base64 48)
    echo -n "What is your masternodeprivkey? (Hint:genkey output)"
    read MASTERNODEPRIVKEY
    echo -e "rpcuser=$rpcuser\nrpcpassword=$rpcpassword\naddnode=45.63.114.118\nserver=1\nlisten=1\nmaxconnections=100\ndaemon=1\nport=61150\nstaking=0\nrpcallowip=127.0.0.1\nexternalip=$VPSIP:61150\nmasternode=1\nmasternodeprivkey=$MASTERNODEPRIVKEY" > /root/.dixicoin/dixicoin.conf


# echo "Get Chaindata"
# cd ~/.dixicoin
# rm -rf database txleveldb smsgDB
# wget https://chaindata.zip
# unzip chaindata.zip

echo "Starting Dixicoin Daemon"
sudo dixicoind --daemon
#echo "Run ./dixicoind"
#screen -dmS dixicoind /dixicoin/src/./dixicoind
echo "If you like this script donate DNR to DBuzzkiLLrF4aTeSbYGWUD9bxKhud9DSiV or buy some Denarius and hodl"
