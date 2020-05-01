#!/bin/bash
set -e

CUR_DIR=$(dirname $(readlink -f "$0"))
NIX_ENVS_DIR=${CUR_DIR}/../nix-envs
source ${CUR_DIR}/settings.sh
nix-channel --add https://nixos.org/channels/${NIX_CHANNEL}
nix-channel --update
mkdir -p ~/.config/nixpkgs/
cp ${NIX_ENVS_DIR}/user.config.nix ~/.config/nixpkgs/config.nix
nix-env -irf ${NIX_ENVS_DIR}/${NIX_DEFAULT_ENV}.nix
