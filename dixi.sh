#!/bin/bash
while true
do
  clear
  echo "====================================="
  echo "Dixicoin Masternode Installer v1.337"
  echo "====================================="
  echo "Enter 1 to Install Pre-Compiled Binary: "
  echo "Enter 2 to Getinfo: "
  echo "Enter 3 to scroll debug.log: "
  echo "Enter 4 to Masternode status: "
  echo "Enter q to exit this menu: "
  echo -e "\n"
  echo -e "Enter your selection \c"
  read answer
  case "$answer" in
    1) bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/DIXI-masternode/master/nocompile.sh)" ;;
    2) dixicoind getinfo ;;
    3) tail -f ~/.dixicoin/debug.log ;;
    4) dixicoind masternode status ;;
    q) exit ;;
  esac
  echo -e "Enter return to continue \c"
  read input
done
