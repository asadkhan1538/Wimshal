#!/data/data/com.termux/files/usr/bin/bash

# WIMSHAL v1.0 — Termux Edition
# Created by: PAPA ASAD

# 🧰 Install everything only once
install_dependencies() {
  termux-setup-storage

  echo "📦 Updating Termux and installing core tools..."
    pkg update -y && pkg upgrade -y

  pkg install -y git python python3 php curl wget tsu figlet lolcat \
    cmatrix neofetch screenfetch cowsay fortune termux-api

  pkg install -y nmap hydra aircrack-ng

  pip install --upgrade pip
  pip install requests gtts

  # Clone SQLMap if not present
  [[! -d "$HOME/sqlmap" ]] && git clone https://github.com/sqlmapproject/sqlmap.git "$HOME/sqlmap"

  # Clone Zphisher if not present
  [[! -d "$HOME/zphisher" ]] && git clone https://github.com/htr-tech/zphisher.git "$HOME/zphisher"

  # Clone MaskPhisher if not present
  [[! -d "$HOME/MaskPhisher" ]] && git clone https://github.com/jaykali/maskphish.git "$HOME/MaskPhisher"

  # Clone Old Cloner if not present
  [[! -d "$HOME/Old-FB" ]] && git clone https://github.com/Rizwanali444/Old-FB "$HOME/Old-FB"

  echo "✅ All tools installed successfully!"
  read -p "Press Enter to return to the menu..."
  }
  # 📘 Facebook Old Cloner
run_old_cloner() {
  cd "$HOME/Old-FB" || { echo "❌ Couldn't find Old-FB"; return;}
  chmod +x XD &&./XD
  read -p "Press Enter to return..."
}

# 🐟 Zphisher
run_zphisher() {
  cd "$HOME/zphisher" || { echo "❌ Zphisher not found"; return;}
  bash zphisher.sh
  read -p "Press Enter to return..."
}

# 🎭 MaskPhisher
run_maskphisher() {
  cd "$HOME/MaskPhisher" || { echo "❌ MaskPhisher not found"; return;}
  bash maskphish.sh
  read -p "Press Enter to return..."
}

# 🕵️ SQLMap
run_sqlmap() {
  cd "$HOME/sqlmap" || { echo "❌ SQLMap not found"; return;}
  read -p "Enter target URL: " url
  python3 sqlmap.py -u "$url" --batch --risk=3 --level=5
  read -p "Press Enter to return..."
}

# 🔍 Nmap
run_nmap() {
  read -p "Enter IP/domain to scan: " target
  nmap -sV "$target"
  read -p "Press Enter to return..."
}

# 🔐 Hydra
run_hydra() {
  read -p "Target IP: " ip
  read -p "Login file path: " login
  read -p "Password file path: " pass
  hydra -L "$login" -P "$pass" "$ip" ssh
  read -p "Press Enter to return..."
}

# 📡 Aircrack-ng
run_aircrack() {
  aircrack-ng --help
  read -p "Press Enter to return..."
}

# 💻 PHP Hosting
run_php_hosting() {
  read -p "Enter directory to host: " dir
  cd "$dir" || { echo "❌ Directory not found."; return;}
  php -S 127.0.0.1:8080
}

# 🎮 Fun Tools
run_fun_tools() {
  echo "1. Matrix Code Rain"
  echo "2. Mobile Info"
  echo "3. GUI Info"
  echo "4. Stylish ASCII Arts"
  read -p "Choose [1-4]: " fun
  case "$fun" in
    1) cmatrix;;
    2) neofetch;;
    3) screenfetch;;
    4) fortune | cowsay | lolcat;;
    *) echo "Invalid choice";;
  esac
  read -p "Press Enter to return..."
}


# Main loop
while true; do
  clear
  echo "================================================"
  figlet "WIMSHAL" | lolcat
  echo "       By: Asad"
  echo "================================================"
  echo ""
  echo "============== MENU =============="
  echo "1. Facebook Cloning"
  echo "2. Zphisher"
  echo "3. MaskPhisher"
  echo "4. SQLMap"
  echo "5. Nmap"
  echo "6. Hydra"
  echo "7. Aircrack-ng"
  echo "8. PHP Hosting"
  echo "9. Fun Terminal Tools"
  echo "10. Install All Dependencies"
  echo "11. Exit"
  echo "=================================="
   read -p "Choose [1-11]: " choice

  case "$choice" in
    1) run_old_cloner;;
    2) run_zphisher;;
    3) run_maskphisher;;
    4) run_sqlmap;;
    5) run_nmap;;
    6) run_hydra;;
    7) run_aircrack;;
    8) run_php_hosting;;
    9) run_fun_tools;;
    10) install_dependencies;;
    11) echo "👋 See you next time!" && exit 0;;
    *) echo "🚫 Invalid option." && sleep 1;;
  esac
done
