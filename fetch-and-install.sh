#!/bin/bash
## This script could be used like 'curl https://raw.githubusercontent.com/fishi0x01/local-env/master/fetch-and-install.sh | sh'
## For security reasons it is prefered though to copy/paste and check locally before executing it

{ # Prevent execution if this script was only partially downloaded
  # TODO: asc
  curl -sL https://github.com/fishi0x01/local-env/archive/master.zip | tar xz;  
  ./local-env/scripts/install/install-nix.sh;
  rm -r ./local-env;
  git clone https://github.com/fishi0x01/local-env.git
  make -C ./local-env/ install-dotfiles
}
