# .profile
# vim:et ts=4 ff=unix:

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

export LANG=ja_JP.UTF-8
export HOMEBREW=~/.homebrew
export PATH=$HOME/bin:$HOME/.pyenv/bin:$HOMEBREW/bin:$HOMEBREW/share/python:$HOMEBREW/share/npm/bin:$HOMEBREW/opt/ruby/bin:$PATH
export MANPATH=$MANPATH:$HOMEBREW/share/man
export GIT_PAGER='less -x4'
export ANT_OPTS=-Dfile.encoding=UTF8

# for vim-fakeclip
export __CF_USER_TEXT_ENCODING='0x1F5:0x08000100:0'

export WORKDIR=$HOME
if [ -d "$HOME/Work" ]; then
    export WORKDIR=$HOME/Work
fi

if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -d "$HOME/google-cloud-sdk" ]; then
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi
    # The next line enables shell command completion for gcloud.
    if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi
fi
