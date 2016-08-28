#!/bin/bash

## change as needed
WATCH_PATH="${HOME}/Code"
DESTINATION_PATH="Code/"

## shouldn't need to change these
LABEL='rsync.code.to.icloud.folder'
SCRIPT_PATH="/usr/local/bin/${LABEL}.sh"

PLIST="${LABEL}.plist"
PLIST_PATH="${HOME}/Library/LaunchAgents/${PLIST}"

sed "s|{{WATCH_PATH}}|${WATCH_PATH}|; s|{{SCRIPT_PATH}}|${SCRIPT_PATH}|; s|{{LABEL}}|${LABEL}|" plist-template > $PLIST_PATH
## take note of the extra slash / after WATCH_PATH.  IT's important
sed "s|{{SRC}}|${WATCH_PATH}/|; s|{{DESTINATION_PATH}}|${DESTINATION_PATH}|;" shell-template > $SCRIPT_PATH

if [ -f $PLIST_PATH ]; then
  launchctl unload $PLIST_PATH
  launchctl load $PLIST_PATH
else
  launchctl load $PLIST_PATH
fi
