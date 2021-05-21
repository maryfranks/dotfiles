alias ll='ls -lah'
alias mv='mv -i'
alias cp='cp -i'

# git aliases
alias gst="git status"
alias gaa="git add --all"
alias gpsh="git push"
alias gcm="git commit -m"
alias gnb="git checkout -b"

# utilities
alias reload="source ~/.bashrc"
alias vcheat="vim /Users/mary.f/cheatsheet"
alias cheatsheet="/Users/mary.f/cheatsheet"

# beehive on-call
alias prodroll="kubectl patch deployment beehive --namespace beehive -p '{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"LAST_MANUAL_RESTART\":\"`date +'%s'`\"}}}}}'"
alias sandboxroll="kubectl patch deployment beehive-sandbox --namespace beehive -p '{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"LAST_MANUAL_RESTART\":\"`date +'%s'`\"}}}}}'"
