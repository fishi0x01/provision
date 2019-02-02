#!/bin/bash

nix-shell -p libffi python37Packages.pip python37Packages.virtualenv python37Packages.virtualenv openssl --run ./venv-install.sh
