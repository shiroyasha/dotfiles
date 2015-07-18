#!/bin/bash

sudo apt-get update -y

sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y vim  
sudo apt-get install -y tree 
sudo apt-get install -y htop
sudo apt-get install -y autoconf
sudo apt-get install -y bison
sudo apt-get install -y build-essential
sudo apt-get install -y libssl-dev
sudo apt-get install -y libyaml-dev
sudo apt-get install -y libreadline6-dev
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y libncurses5-dev
sudo apt-get install -y libffi-dev
sudo apt-get install -y libgdbm3
sudo apt-get install -y libgdbm-dev

mkdir ~/code
mkdir ~/bin

chsh -s /bin/zsh

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
