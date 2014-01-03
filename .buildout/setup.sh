#!/bin/bash

HERE=`dirname "$0"`

mkdir -p ${HERE}/{downloads,eggs}

if [ ! -f "${HERE}/default.cfg" ]; then
  echo "[buildout]
eggs-directory = ${HERE}/eggs
download-cache = ${HERE}/downloads
newest = false
# index = http://pypi.python.jp/
" > ${HERE}/default.cfg
fi
