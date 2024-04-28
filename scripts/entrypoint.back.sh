#!/bin/bash

#if [[ "$1" == 'bash' ]]
#then
#  exec "$@"
#fi
#
#if [[ "$1" == 'sh' ]]
#then
#  exec "$@"
#fi

#
# "MKDOCS" CMDs
# %%%%%%%%%%%%%
#

if [[ "$1" == 'init' ]]
then

  if [[ -f "/mnt/mkdocs.yml" ]]
  then
    echo "[WARNING] mkdocs.yml already exists."
    echo "[WARNING] template not installed."
    exit 1
  fi

  echo "[INFO] installing template."
  cp -r /usr/local/share/mmdocs-tmpl/* .
  echo "[INFO] template installed."

  exit 0

fi



if [[ "$1" == 'clean' ]]
then

  find ./ ! -name 'compose.yml' ! -name '.' -exec rm -rf {} +
  exit 0

fi


exec "$@"
