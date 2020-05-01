#!/bin/bash

CUR_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=${CUR_DIR}/../../dotfiles
source ${DOTFILES_DIR}/dotfiles.list

for dot in "${DOTFILES[@]}"
do
  if [ -L "${HOME}/${dot}" ]; then
    echo "Remove link for ${dot}"
    rm ${HOME}/${dot}
    if [ -f "${HOME}/${dot}.bak" ]; then
      echo "Set .bak ${dot}"
      mv ${HOME}/${dot}.bak ${HOME}/${dot}
    fi
  fi
done
