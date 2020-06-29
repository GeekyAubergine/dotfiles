#!/bin/bash

echo "--------------------------------------"
echo "==>  Updating Brew"
echo "--------------------------------------"
brew update && brew upgrade && brew doctor

echo "--------------------------------------"
echo "==>  Installing Brew Apps"
echo "--------------------------------------"
cd ~/dotfiles/bootstrap && brew bundle

echo "--------------------------------------"
echo "==>  Installing Postgres"
echo "--------------------------------------"
brew install postgresql

echo "--------------------------------------"
echo "==>  Setting up Postgres"
echo "--------------------------------------"
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

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
