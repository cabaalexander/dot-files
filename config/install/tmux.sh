#!/bin/bash

tmuxInstall(){
  echo "[Installing] TMUX"
  (
  TEMP_TMUX_PATH="/tmp/tmux"

  rm -rf ${TEMP_TMUX_PATH}

  git clone https://github.com/tmux/tmux.git ${TEMP_TMUX_PATH}

  cd ${TEMP_TMUX_PATH}

  sh autogen.sh

  ./configure && make

  sudo make install

  cd -

  rm -rf ${TEMP_TMUX_PATH}
  ) &> /dev/null
}

# If this file is running in terminal call the function `tmuxInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "tmux.sh" ]
then
  tmuxInstall "${@}"
fi

