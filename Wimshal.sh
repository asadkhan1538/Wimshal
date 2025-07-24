#!/bin/bash
while true; do
  clear
  echo "================================================"
  figlet "WIMSHAL" | lolcat
  echo "       By:Papa Asad"
  echo "================================================"
  echo ""
  echo "Main Menu:"
  echo "1. FB ID Cloning"
  echo "2. Web Hosting"
  echo "3. Phishing"
  echo "4. About This Tool"
  echo ""
  read -p "So what you chose [1-4]: " choice

  case $choice in
    1)
      echo "=== Facebook Tools ==="
      echo "a. Old ID Cloner"
      echo "b. Token Extractor"
      echo "c. Back to Main Menu"
      read -p "Select an option: " fbopt
      ;;
    2)
      echo "=== Local Hosting ==="
      echo "a. Start PHP Server"
      echo "b. Host HTML Page"
      echo "c. Back to Main Menu"
      read -p "Select an option: " hostopt
      ;;
    3)
      echo "=== Phishing Tools ==="
      echo "a. Zphisher"
      echo "b. KingPhisher"
      read -p "Select an option: " phishopt

      phishopt=$(echo "$phishopt" | tr 'A-Z' 'a-z')
      if [[ "$phishopt" == "a" ]]; then
      if [ ! -d "$HOME/zphisher" ]; then
  git clone https://github.com/htr-tech/zphisher.git "$HOME/zphisher"
fi

cd "$HOME/zphisher" || {
  echo "Failed to enter zphisher directory. Make sure it cloned properly.";
  exit 1;
}

bash zphisher.sh
read -p "Press Enter to return..."
      elif [[ "$phishopt" == "b" ]]; then
        if [ ! -d "$HOME/KingPhisher" ]; then
          git clone https://github.com/rsmusllp/king-phisher.git "$HOME/AdbPhisher"
        fi
        cd "$HOME/KingPhisher" || exit
        bash kingPhisher.sh
        read -p "Press Enter to return..."
      fi
;;
    4)
      clear
      echo "=== About ==="
      echo "Wimshal Tool v1.0"
      echo "Created by: PAPA ASAD"
      echo "Especially Made on-demand for FB Users."
      echo ""
      read -p "Wanna go back?" hostopt
      ;;
    *)
echo "Invalid option. Try again."
      sleep 1
      ;;
  esac
done
exit 0
