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
sudo pacman -S --needed gparted rsync thunderbird libreoffice-fresh nextcloud-client torbrowser-launcher

# development 
sudo pacman -S --needed gammaray entr pandoc texlive texlive-lang
sudo npm install -g @mermaid-js/mermaid-cli
paru -S --needed visual-studio-code-bin
