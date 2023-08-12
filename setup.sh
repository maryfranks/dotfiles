#!/bin/sh
# This is the inital setup script. It creates symlinks for bash_profile and bashrc.
# installs homebrew, homebrew cask and other utilities.
# if file is not executable, run ``` # chmod +x setup.sh ```

echo ""
echo "########################################################################"
echo "###                           Setting up...                          ###"
echo "########################################################################"
echo ""

# install homebrew
echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# symlinks for the files
echo "Creating symlinks..."
ln -s ~/dotfiles/bash_profile ~/.bash_profile
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/vimrc ~/.vimrc

touch secrets

# add homebrew to PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/Mary/.bashrc
eval "$(/opt/homebrew/bin/brew shellenv)"

brew tap homebrew/cask
brew tap homebrew/cask-versions
brew bundle

echo "Installing git and git completion"
brew install git bash-completion 

echo ""
echo "========================================================================"
echo "===          [INFO] Attempted to Install Homebrew                    ==="
echo "===                     and Homebrew Cask                            ==="
echo "===                                                                  ==="
echo "===   *** Run: 'brew doctor' to verify Homebrew installation ***     ==="
echo "===                                                                  ==="
echo "========================================================================"
echo ""
echo ""

source ~/.bashrc