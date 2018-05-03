#!/bin/bash

dockerInstall(){
  echo "[Installing] Docker"
  (
  curl -fsSL get.docker.com | sh
  sudo usermod -a -G docker $USER

  echo "I would relog the account or restart the OS ¯\_(ツ)_/¯"
  ) &> /dev/null
}

# If this file is running in terminal call the function `dockerInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "docker.sh" ]
then
  dockerInstall "${@}"
fi
