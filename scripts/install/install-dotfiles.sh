#!/bin/bash

CUR_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=${CUR_DIR}/../../dotfiles
source ${DOTFILES_DIR}/dotfiles.list

### Link dotfiles
for dot in "${DOTFILES[@]}"
do
  if [ -f "${HOME}/${dot}" ] && [ ! -L "${HOME}/${dot}" ]; then
    echo "Backup ${HOME}/${dot} to ${HOME}/${dot}.bak"
    mv ${HOME}/${dot} ${HOME}/${dot}.bak
  elif [ -L "${HOME}/${dot}" ]; then
    rm "${HOME}/${dot}"
  fi
  echo "Set link for ${dot}"
  ln -s ${DOTFILES_DIR}/${dot} ${HOME}/${dot}
done
