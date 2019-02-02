#!/bin/bash

pass show fishi0x01/Automation/IRSSI/config > ~/.irssi/config
chmod 600 ~/.irssi/config

pass show fishi0x01/Automation/ssh-ident/config > ~/.ssh-ident
chmod 640 ~/.ssh-ident
