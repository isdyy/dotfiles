# .profile
# vim:et ts=4 ff=unix:

# User specific environment and startup programs

export LANG=ja_JP.UTF-8
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export GIT_PAGER='less -x4'
export ANT_OPTS=-Dfile.encoding=UTF8

# for vim-fakeclip
export __CF_USER_TEXT_ENCODING='0x1F5:0x08000100:0'

export WORKDIR=$HOME
if [ -d "$HOME/Work" ]; then
    export WORKDIR=$HOME/Work
fi

export PYENV_ROOT="$HOME/.pyenv"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
