#!/bin/bash
set -e

CUR_DIR=$(dirname $(readlink -f "$0"))
source ${CUR_DIR}/settings.sh
gpg --recv-keys ${NIX_GPG_KEY}
gpg --verify ${CUR_DIR}/install-nix/install-nix-${NIX_VERSION}.asc ${CUR_DIR}/install-nix/install-nix-${NIX_VERSION}
sh ${CUR_DIR}/install-nix/install-nix-${NIX_VERSION}
