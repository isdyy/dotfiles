#!/bin/bash

#set -x

prefix=$(cd $(dirname $0); pwd)
self=$(basename $0)

# not linked to ~/
exclude="$self .gitignore .DS_Store Brewfile README.md"
# linked per entry (e.g. ~/.config/git)
nested=".config"

link() {
  local src=$1 dest=$2
  if [ -h "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    return
  fi
  if [ -e "$dest" ] && [ ! -h "$dest" ]; then
    read -p "${dest} exists. Replace? (moved to ${dest}.orig) [Y/n] " ans
    case "$ans" in [nN]*) return ;; esac
    mv "$dest" "${dest}.orig" || return
  fi
  echo "${dest} <= ${src}"
  ln -snf "$src" "$dest"
  if [ -f "$src/setup.sh" ]; then
    "$src/setup.sh"
  fi
}

for name in $(cd "$prefix"; git ls-files | cut -d '/' -f1 | uniq); do
  case " $exclude " in *" $name "*) continue ;; esac
  case " $nested " in
    *" $name "*)
      mkdir -p "${HOME}/${name}"
      for sub in $(cd "$prefix"; git ls-files "$name" | cut -d '/' -f2 | uniq); do
        case " $exclude " in *" $sub "*) continue ;; esac
        link "${prefix}/${name}/${sub}" "${HOME}/${name}/${sub}"
      done
      ;;
    *)
      link "${prefix}/${name}" "${HOME}/${name}"
      ;;
  esac
done
