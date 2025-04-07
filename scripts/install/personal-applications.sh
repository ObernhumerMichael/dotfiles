# Trading setup

mkdir ~/Applications/trading/
cd ~/Applications/trading/

# strategies
git clone git@github.com:ObernhumerMichael/crypto_strategies.git

# Freqtrade install
sudo pacman -S --needed python python-pip python-virtualenv python-pandas git curl
git clone https://github.com/freqtrade/freqtrade.git
cd freqtrade
git checkout stable Freqtrade
./setup.sh -i

# Freqtrade setup
sourc ./.venv/bin/activate
freqtrade create-userdir --userdir user_data
deactivate
cd ~/


# Some personal applications
sudo pacman -S --needed gparted rsync thunderbird libreoffice-fresh nextcloud-client torbrowser-launcher anki-bin google-chrome poppler ydotool
sudo usermod -aG input $USER
paru -S --needed geogebra-6-bin

# spotify
sudo pacman -S --needed ffmpeg4.4 zenity
paru -S --needed spotify spicetify-cli
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh

# Install systemd service
sudo ln -s /usr/lib/systemd/user/ydotool.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable ydotool
sudo systemctl start ydotool
# Remove the need for sudo
sudo chmod +s $(which ydotool)

# Security related
sudo pacman -S --needed nmap openbsd-netcat qbittorrent clamav rkhunter wireguard-tools systemd-resolvconf proton-vpn-gtk-app libappindicator-gtk3 gnome-shell-extension-appindicator burpsuite macchanger metadata-cleaner john hashcat
paru -S --needed jwt_tool sqlmap tutanota-desktop

# gaming realted
sudo pacman -S --needed steam wine wine-mono wine-gecko winetricks lib32-gnutls samba
paru -S --needed heroic-games-launcher-bin gobuster-bin

sudo systemctl start systemd-resolved
sudo systemctl enable systemd-resolved

# development 
sudo pacman -S --needed gammaray entr pandoc texlive texlive-lang php php-apache composer postgresql
sudo npm install -g @mermaid-js/mermaid-cli
paru -S --needed visual-studio-code-bin insomnia

# install docker
sudo pacman -S --needed docker docker-compose
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
