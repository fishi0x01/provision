#!/bin/bash
## This script could be used like 'curl https://raw.githubusercontent.com/fishi0x01/local-env/master/fetch-and-install.sh | sh'
## For security reasons it is prefered though to copy/paste and check locally before executing it

{ # Prevent execution if this script was only partially downloaded
  export FISHI_VERSION="2019-08-16";
  curl -sL "https://github.com/fishi0x01/local-env/releases/download/${FISHI_VERSION}/${FISHI_VERSION}_fishi-env.tar.gz" -o "${FISHI_VERSION}_fishi-env.tar.gz"; 
  curl -sL "https://github.com/fishi0x01/local-env/releases/download/${FISHI_VERSION}/SHA256SUMS" -o "SHA256SUMS"; 
  sha256sum -c SHA256SUMS || exit 1; 
  tar -xzf "${FISHI_VERSION}_fishi-env.tar.gz"; 
  cd ./local-env;
  ./install.sh $NIX_PROFILE;
  cd ..;
  rm -r ./local-env;
  git clone https://github.com/fishi0x01/local-env.git
}
