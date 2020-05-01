#!/bin/bash
set -e

CUR_DIR=$(dirname $(readlink -f "$0"))
source ${CUR_DIR}/settings.sh
NIX_ENVS_DIR=${CUR_DIR}/../nix-envs
NIX_ENV_CHOICE=${1:-"${NIX_DEFAULT_ENV}"}
nix-channel --add https://nixos.org/channels/${NIX_CHANNEL}
nix-channel --update
mkdir -p ~/.config/nixpkgs/
cp ${NIX_ENVS_DIR}/user.config.nix ~/.config/nixpkgs/config.nix
nix-env -irf ${NIX_ENVS_DIR}/${NIX_ENV_CHOICE}.nix
