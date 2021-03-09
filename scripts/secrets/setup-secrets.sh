#!/bin/bash

mkdir -p ~/.irssi/
pass show fishi0x01/Automation/IRSSI/config 2>/dev/null > ~/.irssi/config
chmod 700 ~/.irssi/config

mkdir -p ~/.jira.d/
pass show fishi0x01/data4life/jira/config.yml 2>/dev/null > ~/.jira.d/config.yml
chmod -R 700 ~/.jira.d/
