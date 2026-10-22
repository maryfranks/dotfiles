# =====================================================================
# Remote Container Zsh Configuration (.zshrc)
# =====================================================================

# --- History Configuration ---
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
HISTDUP=erase
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# --- Environment & Shell Options ---
export CLICOLOR=1
export TERM=xterm-256color
export SHELL=/bin/zsh

# --- Completion ---
autoload -Uz compinit && compinit

# --- Fuzzy Finder (fzf) Integration ---
if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
elif command -v fzf &>/dev/null; then
    source <(fzf --zsh)
fi

# --- Core & Safety Aliases ---
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias mv='mv -i'
alias cp='cp -i'
alias reload="source ~/.zshrc"
alias pip="pip3"

# --- Git Shorthand Aliases ---
alias gst="git status"
alias gaa="git add --all"
alias gpsh="git push"
alias gcm="git commit -m"
alias gnb="git checkout -b"
alias gd="git diff"
alias gl="git log --oneline --graph --max-count=20"

# --- Native Git Prompt Integration ---
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' [%b%u%c]'
zstyle ':vcs_info:git:*' actionformats ' [%b|%a%u%c]'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' stagedstr '+'

setopt prompt_subst

# Rendered Prompt: Directory (Cyan) + Git Status (Green) + Privilege Indicator (#)
PROMPT='%B%F{cyan}%~%f%b%F{green}${vcs_info_msg_0_}%f %# '