#!/bin/bash

echo "--------------------------------------"
echo "==>  Installing Brew"
echo "--------------------------------------"
cd ~/dotfiles/bootstrap && brew bundle

echo ""
echo "--------------------------------------"
echo "==>  Linking Configs"
echo "--------------------------------------"
ln -sF ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/.profile ~/.profile

echo ""
echo "--------------------------------------"
echo "==>  Reloading Profile"
echo "--------------------------------------"
source ~/.profile
