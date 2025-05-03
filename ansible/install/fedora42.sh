#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo dnf install -y make python3-libdnf5 python3-rpm
make -C $SCRIPT_DIR/.. venv

