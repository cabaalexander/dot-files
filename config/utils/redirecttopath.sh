#!/bin/bash

redirectToPath(){
  if [ "${INSTALL_LOG}" == "true" ]
  then
    local TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
    local INSTALL_LOG_PATH_CODE=./install-it-code.log
    local INSTALL_LOG_PATH=./install-it.log
    local APP_NAME=":: cmd -> $@ ::"

    echo -e "\n${APP_NAME}\n" &>> ${INSTALL_LOG_PATH}
    $@ &>> ${INSTALL_LOG_PATH}

    echo -e "\n$? ${APP_NAME}\n" &>> ${INSTALL_LOG_PATH_CODE}
  else
    local TEMP_PATH=$1
    shift

    $@ &>> ${TEMP_PATH:-/dev/null}
  fi
}

# If this file is running in terminal call the function `redirectToPath`
# Otherwise just source it
if [ "$(basename ${0})" = "redirecttopath.sh" ]
then
  redirectToPath "${@}"
fi

