#Wimshal Ethical Hacking Toolkit
#Created By Papa Asad

#!/data/data/com.termux/files/usr/bin/bash
# 🧰 Install everything only once
install_dependencies() {
  echo "📦 Updating Termux and installing core tools..."
  pkg update -y && pkg upgrade -y

  pkg install -y git python python2 python3 dpkg curl wget tsu figlet ruby php nmap termux-api
  gem install lolcat
  pkg install -y cmatrix neofetch screenfetch cowsay fortune
  pip install requests gtts flask
  apt install -y libc++ libnl libpcap libsqlite openssl pcre zlib

  git clone https://github.com/vanhauser-thc/thc-hydra "$HOME/thc-hydra"
  git clone https://github.com/htr-tech/zphisher.git "$HOME/zphisher"
  git clone https://github.com/sqlmapproject/sqlmap.git "$HOME/sqlmap"
  git clone https://github.com/jaykali/maskphish.git "$HOME/MaskPhisher"

  rm -rf "$HOME/tools"
  echo "✅ All tools installed successfully!"
  read -p "Press Enter to return to the menu..."
}
#GPS Phish Tool
run_gps() {
  GPSPHISH_DIR="$HOME/Wimshal/gpsphish"

  cd "$GPSPHISH_DIR" || { echo "❌ Failed to enter gpsphish directory"; read -p "Press Enter to return..."; return;}

  [ -f server.py ] || { echo "❌ server.py not found in $GPSPHISH_DIR"; read -p "Press Enter to return..."; return;}

  echo "🚀 Starting GPSPhish server..."
  python server.py || { echo "❌ Failed to start server.py"; read -p "Press Enter to return..."; return;}

  read -p "Press Enter to return..."
}

# 📘 Facebook Old Cloner
run_old_cloner() {
  SOURCE_DIR="$HOME/Wimshal"
SOURCE_BINARY="$SOURCE_DIR/XD"

TARGET_DIR="$HOME/Old-FB"
TARGET_BINARY="$TARGET_DIR/XD"

# 🚫 Check if target binary already exists
if [ -f "$TARGET_BINARY" ]; then
  echo "✅ XD binary already exists at $TARGET_BINARY"
else
  echo "🔄 XD binary not found. Copying from $SOURCE_DIR..."

  # 🧹 Remove old target directory
  rm -rf "$TARGET_DIR"

  # 📁 Create new target directory
  mkdir -p "$TARGET_DIR"

  # 📦 Copy binary
  cp "$SOURCE_BINARY" "$TARGET_DIR"

  echo "✅ XD binary copied to $TARGET_DIR"
fi
export PATH="$HOME/Old-FB:$PATH"
XD || { echo "❌ Failed to run Old Cloner"; read -p "Press Enter to return..."; return;}
  read -p "Press Enter to return..."
}

# 🐟 Zphisher
run_zphisher() {
  cd "$HOME/zphisher" || { echo "❌ Zphisher not found"; read -p "Press Enter to return..."; return;}
  chmod +x zphisher.sh
./zphisher.sh || { echo "❌ Failed to run Zphisher"; read -p "Press Enter to return..."; return;}
  read -p "Press Enter to return..."
}

# 🎭 MaskPhisher
run_maskphisher() {
  cd "$HOME/MaskPhisher" || { echo "❌ MaskPhisher not found"; read -p "Press Enter to return..."; return;}
  chmod +x maskphish.sh
./maskphish.sh || { echo "❌ Failed to run MaskPhisher"; read -p "Press Enter to return..."; return;}
  read -p "Press Enter to return..."
}

# 🕵️ SQLMap
run_sqlmap() {
  cd "$HOME/sqlmap" || { echo "❌ SQLMap not found"; read -p "Press Enter to return..."; return;}
  read -p "Enter target URL: " url
  python3 sqlmap.py -u "$url" --batch --risk=3 --level=5 || { echo "❌ SQLMap failed"; read -p "Press Enter to return..."; return;}
  read -p "Press Enter to return..."
}

# 🔍 Nmap
run_nmap() {
  read -p "Enter IP/domain to scan: " target
  nmap -sV "$target" || { echo "❌ Nmap scan failed"; read -p "Press Enter to return..."; return;}
  read -p "Press Enter to return..."
}

# 🔐 Hydra
run_hydra() {
  cd "$HOME/thc-hydra" || { echo "❌ Hydra not found"; read -p "Press Enter to return..."; return;}
  read -p "Target IP: " ip
  read -p "Login file path: " login
  read -p "Password file path: " pass
./hydra -L "$login" -P "$pass" "$ip" ssh || { echo "❌ Hydra failed"; read -p "Press Enter to return..."; return;}
  read -p "Press Enter to return..."
}
# 📡 Owner Info
inf_owner() {
  figlet "Owner Asad Baloch" | lolcat
  echo "This tool is made on-demand for ethical purposes only."
  read -p "Press Enter to return..."
}

# 💻 PHP Hosting
run_php_hosting() {
  read -p "Enter directory to host: " dir

  # Try to change directory
  cd "$dir" || {
    echo "❌ Directory not found."
    read -p "Press Enter to return..."
    return
}

  # Start PHP server
  echo "🚀 Starting PHP server at http://127.0.0.1:8080"
  php -S 127.0.0.1:8080 || {
    echo "❌ PHP server failed"
    read -p "Press Enter to return..."
    return
}

  read -p "Press Enter to return..."
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
*🧭 Main Menu Loop*
while true; do
  clear
  #!/bin/bash
cat << "EOF"
██╗    ██╗██╗███╗   ███╗███████╗██╗  ██╗ █████╗ ██╗
██║    ██║██║████╗ ████║██╔════╝██║  ██║██╔══██╗██║
██║ █╗ ██║██║██╔████╔██║███████╗███████║███████║██║
██║███╗██║██║██║╚██╔╝██║╚════██║██╔══██║██╔══██║██║
╚███╔███╔╝██║██║ ╚═╝ ██║███████║██║  ██║██║  ██║███████╗
 ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
EOF
  echo "            By: Asad Baloch"
  echo""  
  echo "            <<Main MENU>>"
  echo "[1] Install All Dependencies"  
  echo "[2] Facebook Cloning"
  echo "[3] Zphisher"
  echo "[4] MaskPhisher"
  echo "[5] SQLMap"
  echo "[6] Nmap"
  echo "[7] Hydra"
  echo "[8] PHP Hosting"
  echo "[9] GPS Hack Tool"
  echo "[10] Fun Terminal Tools"
  echo "[11] About Owner"
  echo "[12] Exit"
  read -p "Your Choice [?]: " choice

  case "$choice" in
    1) install_dependencies;;
    2) run_old_cloner;;
    3) run_zphisher;;
    4) run_maskphisher;;
    5) run_sqlmap;;
    6) run_nmap;;
    7) run_hydra;;
    8) run_php_hosting;;
    9) run_gps;;
    10) run_fun_tools;;
    11) inf_owner;;
    12) echo "👋 See you next time!" && exit 0;;
    *) echo "🚫 Invalid option." && sleep 1;;
  esac
done
