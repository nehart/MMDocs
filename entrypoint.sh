#!/bin/bash

if [[ "$1" == 'bash' ]]
then
  exec "$@"
fi

if [[ "$1" == 'sh' ]]
then
  exec "$@"
fi

#
# "MKDOCS" CMDs
# %%%%%%%%%%%%%
#

if [[ "$1" == 'init' ]]
then

  if [[ -f "/mnt/mkdocs.yml" ]]
  then
    echo "mkdocs.yml found... abort"
    exit 1
  fi

  cp -r /usr/local/share/mmdocs-tmpl/* .
fi

exit 0
