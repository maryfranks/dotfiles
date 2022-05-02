# import aliases, prompt, etc.
source ~/dotfiles/bash_aliases
source ~/dotfiles/bash_prompt
source ~/dotfiles/secrets

# git tab completion (branch / file names)
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# ruby version manaager
eval "$(rbenv init -)"

# gremlin
export GREMLIN_TEAM_ID="05d007d9-1eb1-43f6-9007-d91eb163f6d6"
export GREMLIN_CLUSTER_ID="gke_dev-bonsai-fab1_us-central1_bonsai"

# fixes problems with bash history
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=20000
export HISTFILESIZE=2000000
export HISTTIMEFORMAT=" %Y-%m-%d %H:%M:%S "
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

###################################
export PYTHON_HOME="/Users/mfranks/Library/Python/3.6"
export GCLOUD_CTL_HOME="/Users/mary.f/google-cloud-sdk"
export TERRAFORM_HOME="/usr/local/opt/terraform"

###            Path             ###
###################################

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mary.f/google-cloud-sdk/path.bash.inc' ]; then . '/Users/mary.f/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mary.f/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/mary.f/google-cloud-sdk/completion.bash.inc'; fi
export GOPATH="$HOME/go"
export PATH=$PATH:$PYTHON_HOME/bin:$HOME/bin:$TERRAFORM_HOME/bin:$GOPATH/bin

# these lines needs to come AFTER the last place you export the PATH 
eval "$(direnv hook bash)"
eval "$(nodenv init -)"

# if ctrl+r isn't working, run $(brew --prefix)/opt/fzf/install
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

echo "reloaded"
