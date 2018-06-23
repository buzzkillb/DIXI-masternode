# ![Dixicoin](http://www.dixicoin.net/img/logos/DixiCoin_Logo_Top.png)
```
bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/DIXI-masternode/master/dixi.sh)"
```
Shout outs to [Denarius Coin](https://denarius.io/)
# ![Denarius](https://cdn.discordapp.com/attachments/398821731826925568/439101980875685898/DNRATOM.gif)

## 1. Desktop Wallet Preparation

### 1.1 Setup the wallet
1. Download the [wallet](http://www.dixicoin.net/)
1. Start and Close the wallet. (creates the folder structure)
1. Start the wallet and wait for the sync.

## 2. Masternode Setup

### 2.1 Send the coins to your wallet
1. Open Console (Help => Debug window => Console)
1. Create a new address. `getnewaddress Masternode1`
1. Send exactly 1000 coins to this address. (One transaction, pay attention to the fee)
1. Wait for at least 15 confirmations.
1. Save the transaction id, index `masternode outputs`, and generate and save a new masternode private key `masternode genkey`.
1. You can optionaly encrypt the wallet (Settings => Encypt wallet) for security reasons. Do not forget the password or you lose the coins that you have.
1. Backup `%appdata%/dixicoin/wallet.dat` file. This contains your coins. DO NOT LOSE IT!

### 2.2 VPS setup
1. Register on [Vultr](https://www.vultr.com/?ref=7307426). (or [DigitalOcean](https://m.do.co/c/6dffa03c3628)) (do not forget verify your e-mail)
1. Send some money (10$ is enough for two months) to your account to deploy a server. (1 server cost 5$/mo, some accept bitcoin)
1. Deploy a new server.
    - Server Type: Ubuntu 16.04
    - Server Size: 5$/mo, 1GB memory (This server is capable to run 3 masternodes. One masternode need 150-300Mb memory)

### 2.3 Automatic Masternode Setup
- Note: Use the guides provided on the Dixicoin [website](http://www.dixicoin.net/) to manually setup the server. That guide maybe outdated.
1. Download [putty](https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.70-installer.msi)
1. Start putty and login as root user. (Root password and server ip address is in vultr overview tab)
1. Paste this command and answer the questions:
```
bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/DIXI-masternode/master/dixi.sh)"
```

### 2.4 Add masternode on the desktop wallet

1. Open wallet, wait for sync, unlock wallet
1. Go Masternodes tab
1. Click create
	- Set a name: Masternode1
	- Set the VPS ip and the port: [Ip:Port]
	- Set the generated private key: step 2.1.5
	- Click Add and after click Start
	- Wait 1 day to start receiving coins. Check your the masternode address here: [http://dixi.live/](https://denariusexplorer.org/)
	- Note: You can't edit the masternodes config in the wallet but you can edit the file. `%appdata%/dixicoin/masternode.conf`.

## 3. FAQ

1. What if I restart the server?
	- The script setup a cron job so the masternode automaticly starts every time when the vps turns on.
1. How to get masternode profit?
	- Enable coin control feature (Settings => Options => Display => Display coin controll feature)
	- Go send tab
	- Select from the input button only the 5 coin lines
	- Click OK
	- You can send selected amount to an address.
	- Note: DO NOT EVER Transfer DXC from that original 1000 deposit or you'll break your Masternode.
1. What is the password for the mn1, mn2, ...mnX accounts?
	- There is no default password. When you create a user it does not have a password yet, so you cannot login with that username until you create a password. There is one other way to act as a new user without its password. As root type `su - mn1`
	- You need to set a password for the user. Use the passwd command: `passwd mn1`
1. I get the following error: "Could not allocate vin"
	- Make sure your wallet fully synced and UNLOCKED.
1. How many masternodes can I run using one IP/server?
	- The limit is only the memory. One masternode requires 150-300MB ram. A server with 1GB memory can run 3 masternodes.
1. My wallet says my masternodes are not running.
	- The wallet will tell you its not running sometimes when it is. If you still receving the masternode rewards then everything is fine.
1. I got stuck. Can you help me?
	- Try to get help from the cummunity
		- [dixicoin discord](https://discordapp.com/invite/c7pujNb)
