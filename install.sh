#!/usr/bin/env bash

# set -e          # Exit on error
# set -o pipefail # Exit on pipe error
# set -x          # Enable verbosity

echo $(pwd)

OLD_DOTFILES="dotfile_bk_$(date -u +"%Y%m%d%H%M%S")"
mkdir $OLD_DOTFILES

function backup_if_exists() {
    if [ -f $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi

    if [ -d $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi
}

# ===============================
# Backup old dotfiles
# ===============================
echo "[dotfiles] [Backup] Backing up old dotfiles"
backup_if_exists ~/.bash_profile
backup_if_exists ~/.bashrc
backup_if_exists ~/.zshrc
backup_if_exists ~/.gitconfig
backup_if_exists ~/.tmux.conf
backup_if_exists ~/.profile

# ===============================
# Config Terminal
# ===============================

echo "[dotfiles] [Terminal]"
# install zsh
echo "[dotfiles] [Terminal] Installing zsh"
sudo apt install zsh
echo "[dotfiles] [Terminal] Configuring zsh"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
sudo bash ./shell-tools/zsh/config_zprezto.sh
if [ ! -f ~/.zshrc ]; then
    touch ~/.zshrc
fi
echo "source $(pwd)/shell-tools/zsh/alias.zsh" >> ~/.zshrc
ln -fs $(pwd)/shell-tools/zsh/zpreztorc ~/.zpreztorc

# install vim
echo "[dotfiles] [Terminal] Installing vim"
sudo apt install vim-gtk3
echo "[dotfiles] [Terminal] Configuring vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -fs $(pwd)/shell-tools/vim/vimrc ~/.vimrc
sudo curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&apt-get install -y nodejs

# install bat
echo "[dotfiles] [Terminal] Installing bat"
sudo apt install bat
echo "[dotfiles] [Terminal] Configuring bat"
ln -fs $(pwd)/shell-tools/bat ~/.config/bat

# install tmux
echo "[dotfiles] [Terminal] Installing tmux"
sudo apt install tmux
echo "[dotfiles] [Terminal] Configuring tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -fs $(pwd)/shell-tools/tmux/tmux.conf ~/.tmux.conf
sudo apt install  xsel

# install tree
echo "[dotfiles] [Terminal] Installing tree"
sudo apt install tree

# install ffmpeg
echo "[dotfiles] [Terminal] Installing ffmpeg"
sudo apt install ffmpeg
sudo apt install ffprobe

echo "[dotfiles] [Terminal] Installing translate-shell"
sudo apt install translate-shell
ln -fs $(pwd)/shell-tools/translate-shell ~/.translate-shell

echo "[dotfiles] [Terminal] Installing mediainfo"
sudo apt install mediainfo

echo "[dotfiles] [Terminal] Installing glow"
sudo apt install glow


# ===============================
# Gnome Desktop Environment
# ===============================
# add Flatpak support
echo "[dotfiles] [Gnome Desktop Environment] Adding Flatpak support"
sudo apt install flatpak gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install gnome extensions manager
echo "[dotfiles] [Gnome Desktop Environment] Installing gnome extensions manager"
flatpak install flathub com.mattjakeman.ExtensionManager
# Then download the extensions:
#     https://extensions.gnome.org/extension/615/appindicator-support
#     https://extensions.gnome.org/extension/19/user-themes/
#     https://extensions.gnome.org/extension/53/pomodoro/
#     https://extensions.gnome.org/extension/750/openweather/
#     https://extensions.gnome.org/extension/744/hide-activities-button/
#     https://extensions.gnome.org/extension/1319/gsconnect/
#     https://extensions.gnome.org/extension/5009/gpu-profile-selector
#     https://extensions.gnome.org/extension/307/dash-to-dock/
#     https://extensions.gnome.org/extension/3740/compiz-alike-magic-lamp-effect/
#     https://extensions.gnome.org/extension/4839/clipboard-history/
#     https://extensions.gnome.org/extension/3193/blur-my-shell/

# install gnome tweaks
echo "[dotfiles] [Gnome Desktop Environment] Installing gnome tweaks"
sudo apt install gnome-tweaks

# uninstall firefox
echo "[dotfiles] [Gnome Desktop Environment] Uninstalling firefox"
sudo apt remove firefox-esr

# remove libreoffice
echo "[dotfiles] [Gnome Desktop Environment] Removing libreoffice"
sudo apt remove libreoffice-common libreoffice-core libreoffice-gnome libreoffice-gtk3 libreoffice-help-common libreoffice-help-en-us libreoffice-style-colibre libreoffice-style-elementary

echo "[dotfiles] [Gnome Desktop Environment] Installing flameshot"
sudo apt install flameshot

echo "[dotfiles] [Gnome Desktop Environment] Installing mpv"
sudo apt install mpv
ln -fs $(pwd)/desktop-tools/mpv ~/.config

echo "[dotfiles] [Gnome Desktop Environment] Beautify"
mkdir -p ~/util/gnome-theme/ ~/util/gnome-wallpapers/

echo "[dotfiles] [Gnome Desktop Environment] Installing WhiteSur-gtk-theme"
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git ~/util/gnome-theme/WhiteSur-gtk-theme
~/util/gnome-theme/WhiteSur-gtk-theme/install.sh -t all -m -N mojave -l -c Light --round
sudo ./tweaks.sh -g

echo "[dotfiles] [Gnome Desktop Environment] Installing WhiteSur-icon-theme"
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git ~/util/gnome-theme/WhiteSur-icon-theme
~/util/gnome-theme/WhiteSur-icon-theme/install.sh

echo "[dotfiles] [Gnome Desktop Environment] Installing WhiteSur-cursor-theme"
git clone https://github.com/vinceliuice/WhiteSur-wallpapers.git ~/util/gnome-wallpapers/WhiteSur-wallpapers
sudo ~/util/gnome-wallpapers/WhiteSur-wallpapers/install-gnome-backgrounds.sh

# install trash
echo "[dotfiles] [Gnome Desktop Environment] Installing trash"
sudo apt install trash-cli

# ===============================
# Config Development Environment
# ===============================
echo "[dotfiles] [Development Environment]"
# install java
echo "[dotfiles] [Development Environment] Installing java"
sudo apt install openjdk-17-jdk

# install python
echo "[dotfiles] [Development Environment] Installing python"
sudo apt install python3

mkdir ~/Development

# install tomcat
echo "[dotfiles] [Development Environment] Installing tomcat"
wget -P ~/Development https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.10/bin/apache-tomcat-10.1.10.tar.gz
tar -xvzf ~/Development/apache-tomcat-10.1.10.tar.gz -C ~/Development
rm ~/Development/apache-tomcat-10.1.10.tar.gz

# install maven
echo "[dotfiles] [Development Environment] Installing maven"
wget -P ~/Development https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.tar.gz
tar -xvzf ~/Development/apache-maven-3.9.3-bin.tar.gz -C ~/Developmentsudo ln -s ~/Development/apache-maven-3.9.3/bin/mvn /usr/local/bin/mvn


