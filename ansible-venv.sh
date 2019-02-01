#!/bin/bash

sudo apt-get install python3-apt
virtualenv ansible/ansible-venv
source ansible/ansible-venv/bin/activate
pip install -r ansible/requirements.txt
