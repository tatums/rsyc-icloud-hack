## Problem

I tried to use iCloud drive to host my code folder as an instant backup. It
didn't go so great, I found a process (bird) that was constantly working my
processor. After more investigation, I found it had problems with `node_modules`
and `.git` folders. I looked to see if I could simply ignore the trouble
folders, but couldn't find any support for that.

## Solution

Use rsync to filter out the unwanted files and folders.

My main code folder is located in `$HOME/Code`. I then rsyc the `$HOME/Code` folder (without the unwanted files and folders) to `"${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Code/"`

<hr />

## SETUP

Clone this repo and execute `$ ./bootstrap.sh`


## NOTES

http://www.thegeekstuff.com/2011/01/rsync-exclude-files-and-folders/?utm_source=feedburner

    rsync -avz --exclude '*node_modules*' --exclude '*.git*' --exclude '*.DS_Store' '/Users/tatumszymczak/Code/' '/Users/tatumszymczak/Library/Mobile Documents/com~apple~CloudDocs/Code/'

#### generated files
`/Users/tatumszymczak/Library/LaunchAgents/rsync.code.to.icloud.folder.plist`
`/usr/local/bin/rsync.code.to.icloud.folder.sh

## launchctl commands
    launchctl load /Users/tatumszymczak/Library/LaunchAgents/rsync.code.to.icloud.folder.plist
    launchctl unload /Users/tatumszymczak/Library/LaunchAgents/rsync.code.to.icloud.folder.plist
    launchctl start rsync.code.to.icloud.folder
