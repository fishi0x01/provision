#!/bin/bash
set -e

CUR_DIR=$(dirname $(readlink -f "$0"))
source ${CUR_DIR}/settings.sh

# https://github.com/NixOS/nixos-homepage/blob/master/edolstra.gpg
# this is helpful in case keyservers are down
# -> Since 2.13.0 no gpg signature is provided
#gpg --import ${CUR_DIR}/install-nix/nix-edolstra.asc

# Atlernatively pull keys from public server
#gpg --recv-keys ${NIX_GPG_KEY}

# -> Since 2.13.0 no gpg signature is provided
#gpg --verify ${CUR_DIR}/install-nix/install-nix-${NIX_VERSION}.asc ${CUR_DIR}/install-nix/install-nix-${NIX_VERSION}
sh ${CUR_DIR}/install-nix/install-nix-${NIX_VERSION}
