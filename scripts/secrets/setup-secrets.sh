#!/bin/bash

pass show fishi0x01/Automation/IRSSI/config 2>/dev/null > ~/.irssi/config
chmod 600 ~/.irssi/config

pass show fishi0x01/Automation/ssh-ident/config 2>/dev/null > ~/.ssh-ident
chmod 640 ~/.ssh-ident

mkdir -p ~/.jira.d/
pass show fishi0x01/data4life/jira/config.yml 2>/dev/null > ~/.jira.d/config.yml
chmod -R 644 ~/.jira.d/
