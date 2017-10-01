#!/bin/sh
set -x
sudo launchctl load -w /Library/LaunchAgents/org.macports.gpg-agent.plist
