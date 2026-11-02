#!/bin/bash

#set -x

prefix=$(cd $(dirname $0); pwd)
self=$(basename $0)

for name in $(cd $prefix; git ls-files | cut -d '/' -f1 | uniq | grep -v "$self"); do
  src=${prefix}/${name}
  dest=${HOME}/${name}
  if [ ! -h $dest -o "$(readlink ${dest})" != "${src}" ]; then
    echo "${dest} <= ${src}"
    ln -snf ${src} ${dest}
    if [ -f ${src}/setup.sh ]; then
       ${src}/setup.sh
    fi
  fi
done
