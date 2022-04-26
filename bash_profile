if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
export PATH="/usr/local/opt/helm@2/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mary/google-cloud-sdk/path.bash.inc' ]; then . '/Users/mary/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mary/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/mary/google-cloud-sdk/completion.bash.inc'; fi
