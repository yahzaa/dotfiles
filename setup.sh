#!/bin/bash
# Setup initial environment for a fresh ubuntu installation.

clear

echo "Updating repositories."
sudo apt-get update

echo "Installing dev tools."
sudo apt-get install -y emacs vim git python-flake8 pep8 pyflakes zsh

echo "Installing i3"
sudo apt-get install i3

echo "Setting zsh"
ln -s zshrc ~/.zshrc
chsh -s zsh

echo "Installing monaco font."
wget https://github.com/todylu/monaco.ttf/raw/master/monaco.ttf -O ~/Downloads/monaco.ttf
if [ ! -d "~/.fonts" ]; then
    mkdir ~/.fonts
fi
mv ~/Downloads/monaco.ttf ~/.fonts/
fc-cache -f -v

echo "Configuring Emacs."
mv ~/.emacs ~/.emacs.bak
mv ~/.emacs.d ~/.emacs.d.bak
mkdir ~/.emacs.d
ln -s emacs_init.el ~/.emacs.d/init.el
emacs

echo "Configuring i3."
mv ~/.i3 ~/.i3.bak
mkdir ~/.i3
ln -s i3config ~/.i3/config
ln -s i3status.conf ~/.i3/i3status.conf
