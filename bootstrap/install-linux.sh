#!/bin/bash

echo ""
echo "--------------------------------------"
echo "==>  Linking Configs"
echo "--------------------------------------"
ln -sF ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zshrc ~/.zshrc

echo ""
echo "--------------------------------------"
echo "==>  Reloading Profile"
echo "--------------------------------------"
source ~/.zshrc
