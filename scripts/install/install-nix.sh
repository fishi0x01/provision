#!/bin/bash

CUR_DIR=$(dirname $(readlink -f "$0"))
NIX_DIR=${CUR_DIR}/../../nix
${NIX_DIR}/installer/install-nix.sh
source ~/.nix-profile/etc/profile.d/nix.sh
${NIX_DIR}/installer/install-env.sh
