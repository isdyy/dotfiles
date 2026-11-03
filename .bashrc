# .bashrc
# User specific aliases and functions
# vim:et ts=4 ff=unix:

alias diff="diff -u"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

PS1='[\u@\h \W]\$ '

if [ -n "$HOMEBREW_PREFIX" ]; then
    if [ -f "$HOMEBREW_PREFIX/etc/bash_completion" ]; then
        . "$HOMEBREW_PREFIX/etc/bash_completion"
    fi
    if [ -f "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.bash.inc" ]; then
        . "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.bash.inc"
    fi
    if [ -f "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]; then
        . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
    fi
fi

# Python
if command -v pyenv >/dev/null; then
    eval "$(pyenv init -)"
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
