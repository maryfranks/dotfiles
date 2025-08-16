#!/bin/sh
# This is the inital setup script. It creates symlinks for zshrc.
# installs homebrew and other utilities.
# if file is not executable, run ``` # chmod +x setup.sh ```

echo ""
echo "########################################################################"
echo "###                           Setting up...                          ###"
echo "########################################################################"
echo ""


# install homebrew (if it's not installed already)
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi


# TODO: create directories for .zsh/plugins and .zsh/themes
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

# Configure Starship
## install nerd font
brew install --cask font-inconsolata-nerd-font

if test -f ~/.config/starship.toml; then
  echo "starship.toml already exists, creating backup: starship-backup."

  mv ~/.config/starship.toml ~/starship-backup
fi

brew install starship

if test ! -d ~/.config; then
  mkdir ~/.config
else
  ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
fi

echo "brewing..."

# TODO is brew bundle still the way?
brew bundle

# TODO Run these two commands after I install the zsh-completion. might break hard. maybe leave that out of brewfile?
# chmod -R go-w '/opt/homebrew/share'
# chmod -R go-w '/opt/homebrew/share/zsh'

# configure vscode
# do this after the vscode install with brew bundle above
rm ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
cp -R vscode/themer-future-pro ~/.vscode/extensions/

# TODO This is not right anymore
echo "Installing git and git completion"
# Create the folder structure
mkdir -p ~/.zsh
cd ~/.zsh
# Download the scripts
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh


# configure vim

# vim setup not working

## Install vimplug
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vimcurl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

##  Install vim-plug if not found
# if empty(glob('~/.vim/autoload/plug.vim'))
#   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
#     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# endif

## Run PlugInstall if there are missing plugins
# autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
#   \| PlugInstall --sync | source $MYVIMRC
# \| endif

# if test -f ~/.vimrc; then
#   echo ".vimrc already exists, creating backup: vimrc-backup."

#   mv ~/.vimrc ~/vimrc-backup
# fi
# ln -s ~/dotfiles/vimrc ~/.vimrc

echo "All done!"