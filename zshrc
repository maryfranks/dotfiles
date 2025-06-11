ZSH=$HOME/.zsh

# plugins=(git fzf)


### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history
# How many commands zsh will load to memory.
export HISTSIZE=10000
# How many commands history will save on file.
export SAVEHIST=10000
# History won't save duplicates.
HISTDUP=erase
setopt hist_ignore_dups
setopt hist_ignore_all_dups
# History won't show duplicates on search.
setopt hist_save_no_dups
setopt hist_find_no_dups

setopt appendhistory
setopt sharehistory
setopt incappendhistory



# Aliases
alias ll='ls -lah'
alias mv='mv -i'
alias cp='cp -i'
alias reload="source $HOME/.zshrc"
alias vcheat="vim /Users/mary.franks/cheatsheet"
alias pip="pip3"

# git aliases
alias gst="git status"
alias gaa="git add --all"
alias gpsh="git push"
alias gcm="git commit -m"
alias gnb="git checkout -b"


# THIS IS NOT WORKING - NO GIT COMPLETION
# if type brew &>/dev/null; then
#     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

#     autoload -Uz compinit
#     compinit
# fi
# fpath=($ZSH/plugins/zsh-completions/src $fpath)

# gcloud sdk
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]; then . "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then . "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"; fi

# export USE_GKE_GCLOUD_AUTH_PLUGIN=True

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Recursion
source "$HOME/.config/netskope/env.sh"

# automatically sources autocompletion scripts 
autoload -Uz compinit && compinit

# Kubectl autocompletion
source <(kubectl completion zsh)

# alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
source /Users/mary.franks/.griphook/env

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(starship init zsh)"



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
