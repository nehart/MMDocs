#!/bin/bash

#
# GitLab "CICD"
# %%%%%%%%%%%%%
#
# It is necessary to consider certain factors before using CICD.
#
# When a CICD job runs in a Docker container ...
#
#   *) The runner starts the Docker container using the defined entrypoint. 
#   *) the runner mounts a "/builds" directory, which contains the repository's content.
#   *) The runner attaches itself to a running container.
#   *) The runner prepares a script (the combination of "before_script", "script", and "after_script").
#   *) The runner executes the "before_script", "script", and "after_script" commands in the "/builds/<project-path>/" directory.
#
# By default, the Docker executor does not override the ENTRYPOINT script. The runner expects that the image has no ENTRYPOINT or
# that the ENTRYPOINT is prepared to start a shell by passing "sh" or "bash" as the CMD.
#
# In the event that the Docker image in question lacks the requisite support for this mechanism, it is possible to override the image’s
# ENTRYPOINT within the project configuration (the ".gitlab-ci.yml" file). This can be achieved as follows:
#
#   # [...]
#   #
#   # image:
#   #   name: mariadb:experimental
#   #   entrypoint: [""]
#   #
#   # [...]
#

if [[ "$1" == 'bash' ]]
then

  exec "$@"
  exit 0

fi

if [[ "$1" == 'sh' ]]
then

  exec "$@"
  exit 0

fi

#
# "MMDOCS" CLEANUP
# %%%%%%%%%%%%%%%%
#

if [[ "$1" == 'clean' ]]
then

  find ./ ! -name 'compose.yml' ! -name '.' -exec rm -rf {} +
  exit 0

fi

#
# "MMDOCS" CREATE A PROJECT IF NO ONE EXISTS
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#

if [[ ! -f "/mnt/mkdocs.yml" ]]
then

  echo "[INFO] no mkdocs project found"
  echo "[INFO] installing template."
  cp -r /usr/local/share/mmdocs-tmpl/* .
  echo "[INFO] template installed."
  echo ""
  echo ""

fi

#
# "MMDOCS" UPDATE A PROJECT
# %%%%%%%%%%%%%%%%%%%%%%%%%
#

if [[ "$1" == 'update' ]]
then

  echo "[INFO] replacing file mkbase.yml"
  cp -r /usr/local/share/mmdocs-tmpl/mkbase.yml .
  echo "[INFO] project updated."

  exit 0

fi

#
# "MMDOCS" DEFAULT COMMAND
# %%%%%%%%%%%%%%%%%%%%%%%%
#

exec "mkdocs" "$@"
