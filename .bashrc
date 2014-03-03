# .bashrc
# User specific aliases and functions
# vim:et ts=4 ff=unix:

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

PS1='[\u@\h \W]\$ '

# source-highlight with custom settings
#if [ -f "$HOME/.source-highlight/bashrc" ]; then
#   . $HOME/.source-highlight/bashrc
#fi

# Python
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  eval "$(pyenv init -)"
  if [ "$PYENV_VERSION" != "" ]; then
    pyenv shell $PYENV_VERSION
  fi
fi

alias diff="diff -u"

# git completion
if [ -f "$HOME/.homebrew/etc/bash_completion.d/git-completion.bash" ]; then
    source "$HOME/.homebrew/etc/bash_completion.d/git-completion.bash"
fi


function git-cd()
{
    local d=$(git rev-parse --show-cdup)
    if [ -d "./$d" -a -d "./$d/.git" ]; then
        if [ $# = 1 -a -d "./$d/$1" ]; then
            local d="$d/$1"
        fi
        cd "./$d"
    fi
}

function git-stash-all()
{
    git-cd
    if [ $? -ne 0 ]; then
        return 1
    fi
    local gftu=".gftu"
    git ls-files -o > $gftu
    git add -f `cat $gftu`
    git stash
}

function git-unstash-all()
{
    git-cd
    if [ $? -ne 0 ]; then
        return 1
    fi
    local gftu=".gftu"
    git stash pop
    git rm --cached `cat $gftu`
    rm $gftu
}
