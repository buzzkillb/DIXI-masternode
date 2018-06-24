#!/bin/bash
while true
do
  clear
  echo "====================================="
  echo "Dixicoin Masternode Installer v1.337"
  echo "====================================="
  echo "Enter 1 to Install Pre-Compiled Binary: "
  echo "Enter 2 to Update Compiled Wallet: "
  echo "Enter 3 to Getinfo: "
  echo "Enter 4 to scroll debug.log: "
  echo "Enter 5 to Masternode status: "
  echo "Enter q to exit this menu: "
  echo -e "\n"
  echo -e "Enter your selection \c"
  read answer
  case "$answer" in
    1) bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/DIXI-masternode/master/nocompile.sh)" ;;
    2) bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/DIXI-masternode/master/update-nocompile.sh)" ;;
    3) dixicoin-cli getinfo ;;
    4) tail -f ~/.dixicoin/debug.log ;;
    5) dixicoin-cli masternode status ;;
    q) exit ;;
  esac
  echo -e "Enter return to continue \c"
  read input
done
