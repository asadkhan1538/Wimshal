#!/bin/bash

# Function to install all required dependencies
install_dependencies() {
  clear
  echo "Installing all necessary tools..."
  sleep 1

  # Package manager check
  if command -v apt &>/dev/null; then
    apt update && apt upgrade

    apt install -y \
      git python python3 php figlet lolcat cmatrix neofetch screenfetch fortune cowsay \
      nmap sqlmap hydra aircrack-ng iwconfig 

    # Install pip packages if missing
    command -v pip3 &>/dev/null || apt install -y python3-pip
    pip3 install gtts requests 

    echo "✅ All dependencies installed!"
  else
    echo "Unsupported package manager. Please install tools manually."
  fi
  read -p "Press Enter to return to the menu..."
}

# Main loop
while true; do
  clear
  echo "================================================"
  figlet "WIMSHAL" | lolcat
  echo "       By: Asad"
  echo "================================================"
  echo ""
  echo "Main Menu:"
  echo "1. FB ID Cloning"
  echo "2. Web Hosting Tools"
  echo "3. Phishing Kits"
  echo "4. Hack & Scan Utilities"
  echo "5. Fun Terminal Tools"
  echo "6. Aircrack-ng Suite"
  echo "7. About"
  echo "8. Exit"
  echo "I. Install Dependencies"
  echo ""

  read -p "Choose an option [1-8/I]: " choice
  choice=$(echo "$choice" | tr 'a-z' 'A-Z')

  case "$choice" in
    1)
      clear
      echo "=== Facebook Cloning ==="
      echo "a. Old Cloner
      echo "b. Back"
      read -p "Select: " fbopt
      fbopt=$(echo "$fbopt" | tr 'A-Z' 'a-z')

      if [[ "$fbopt" == "a" ]]; then
        REPO="$HOME/Old-FB"
        [[! -d "$REPO" ]] && git clone https://github.com/Rizwanali444/Old-FB "$REPO"
        cd "$REPO" || { echo "Directory error"; continue;}
        chmod +x XD &&./XD
        read -p "Press Enter to continue..."  
fi
;;

    2)
      clear
      echo "=== Web Hosting Tools ==="
      echo "a. Start PHP server"
      echo "b. Host HTML file"
      echo "c. Back"
      read -p "Select: " hostopt
      hostopt=$(echo "$hostopt" | tr 'A-Z' 'a-z')

      if [[ "$hostopt" == "a" ]]; then
        read -p "Enter directory to serve: " dir
        cd "$dir" || { echo "Directory not found"; continue;}
        php -S 127.0.0.1:8080
      elif [[ "$hostopt" == "b" ]]; then
        read -p "Enter full HTML file path: " html
        [[ -f "$html" ]] && xdg-open "$html" || echo "File not found"
      fi
      read -p "Press Enter to continue..."
;;

    3)
      clear
      echo "=== Phishing Kits ==="
      echo "a. Zphisher"
      echo "b. KingPhisher"
      echo "c. HiddenEye"
      read -p "Select: " phishopt
      phishopt=$(echo "$phishopt" | tr 'A-Z' 'a-z')

      if [[ "$phishopt" == "a" ]]; then
        REPO="$HOME/zphisher"
        [[! -d "$REPO" ]] && git clone https://github.com/htr-tech/zphisher.git "$REPO"
        cd "$REPO" && bash zphisher.sh
      elif [[ "$phishopt" == "b" ]]; then
        REPO="$HOME/KingPhisher"
        [[! -d "$REPO" ]] && git clone https://github.com/rsmusllp/king-phisher.git "$REPO"
        cd "$REPO" && bash kingPhisher.sh
      elif [[ "$phishopt" == "c" ]]; then
        REPO="$HOME/HiddenEye"
        [[! -d "$REPO" ]] && git clone https://github.com/DarkSecDevelopers/HiddenEye "$REPO"
        cd "$REPO" && python3 HiddenEye.py
      fi
      read -p "Press Enter to continue..."
;;
    4)
       clear
       echo "=== Hack & Scan Utilities ==="
      echo "a. Nmap Scanner"
      echo "b. SQLMap Injection Test"
      echo "c. Hydra Brute Force"
      read -p "Select: " hackopt
      hackopt=$(echo "$hackopt" | tr 'A-Z' 'a-z')

      if [[ "$hackopt" == "a" ]]; then
        read -p "Enter target IP/domain: " target
        nmap -sV "$target"
      elif [[ "$hackopt" == "b" ]]; then
        read -p "Enter vulnerable URL: " url
        sqlmap -u "$url" --batch --risk=3 --level=5
      elif [[ "$hackopt" == "c" ]]; then
        read -p "Target IP/service: " ip
        read -p "Login file: " login
        read -p "Password file: " pass
        hydra -L "$login" -P "$pass" "$ip" ssh
      fi
      read -p "Press Enter to continue..."
;;

    5)
      clear
      echo "=== Fun Terminal Tools ==="
      echo "a. cmatrix"
      echo "b. neofetch"
      echo "c. screenfetch"
      echo "d. cowsay + fortune"
      read -p "Select: " funopt
      funopt=$(echo "$funopt" | tr 'A-Z' 'a-z')

      case "$funopt" in
        a) cmatrix;;
        b) neofetch;;
        c) screenfetch;;
        d) fortune | cowsay | lolcat;;
        *) echo "Invalid option!";;
      esac
      read -p "Press Enter to continue..."
;;

    6)
      clear
      echo "=== Aircrack-ng Suite ==="
      apt install aircrack-ng -y
      aircrack-ng --help
      read -p "Press Enter to continue..."
;;

    7)
      clear
      echo "=== About Wimshal Tool ==="
      echo "Version: 3.0"
      echo "Created by: PAPA ASAD"
      echo "Toolkit for Facebook ID Cloning and Almost Every Famous Terminal Tools."
      echo "Designed to make exploration engaging and accessible."
      read -p "Press Enter to return..."
;;

    8)
      echo "Exiting... Have a fun day with WIMSHAL!"
      exit 0
;;

    I)
      install_dependencies
;;

    *)
      echo "❌ Invalid option. Try again..."
      sleep 1
;;
  esac
  done


