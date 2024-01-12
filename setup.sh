#!/bin/sh
# This is the inital setup script. It creates symlinks for zshrc.
# installs homebrew and other utilities.
# if file is not executable, run ``` # chmod +x setup.sh ```

echo ""
echo "########################################################################"
echo "###                           Setting up...                          ###"
echo "########################################################################"
echo ""

# Install oh my zsh with curl command
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vimcurl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symlinks for the files
echo "Creating symlinks..."
if test -f ~/.zshrc; then
  echo ".zshrc already exists, creating backup: zshrc-backup."

  mv ~/.zshrc ~/zshrc-backup
fi
ln -s ~/dotfiles/zshrc ~/.zshrc

if test -f ~/.gitconfig; then
  echo ".gitconfig already exists, creating backup: gitconfig-backup."

  mv ~/.gitconfig ~/gitconfig-backup
fi
ln -s ~/dotfiles/gitconfig ~/.gitconfig

if test -f ~/.gitignore_global; then
  echo ".gitignore_global already exists, creating backup: gitignore_global-backup."

  mv ~/.gitignore_global ~/gitignore_global-backup
fi
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global

if test -f ~/.vimrc; then
  echo ".vimrc already exists, creating backup: vimrc-backup."

  mv ~/.vimrc ~/vimrc-backup
fi
ln -s ~/dotfiles/vimrc ~/.vimrc

if test -f ~/.p10k.zsh; then
  echo ".p10k.zsh already exists, creating backup: p10k.zsh-backup."

  mv ~/.p10k.zsh ~/p10k.zsh-backup
fi
ln -s ~/dotfiles/p10k.zsh ~/.p10k.zsh

# install homebrew (if it's not installed already)
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi

echo "brewing..."
brew bundle

echo "Installing git and git completion"
# Create the folder structure
mkdir -p ~/.zsh
cd ~/.zsh
# Download the scripts
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

echo "All done!"