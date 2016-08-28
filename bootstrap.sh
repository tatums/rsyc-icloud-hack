#!/bin/bash

## change as needed
WATCH_PATH="${HOME}/Code"

## shouldn't need to change these
LABEL='rsync.code.to.icloud.folder'
SCRIPT_PATH="/usr/local/bin/${LABEL}.sh"
PLIST="${LABEL}.plist"

sed "s|{{WATCH_PATH}}|${WATCH_PATH}|; s|{{SCRIPT_PATH}}|${SCRIPT_PATH}|; s|{{LABEL}}|${LABEL}|" plist-template > "${HOME}/Library/LaunchAgents/${PLIST}"
## take note of the extra slash / after WATCH_PATH.  IT's important
sed "s|{{SRC}}|${WATCH_PATH}/|" shell-template > $SCRIPT_PATH

launchctl load $HOME/Library/LaunchAgents/$PLIST
