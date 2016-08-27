http://www.thegeekstuff.com/2011/01/rsync-exclude-files-and-folders/?utm_source=feedburner

    rsync -avz --exclude '*node_modules*' --exclude '*.git*' --exclude '*.DS_Store' source/ target/

    rsync -avz --exclude '*node_modules*' --exclude '*.git*' --exclude '*.DS_Store' '/Users/tatumszymczak/Code/' '/Users/tatumszymczak/Library/Mobile Documents/com~apple~CloudDocs/Code/'



## backup script
s3-backup.sh

## plist file
/Users/tatumszymczak/Library/LaunchAgents/s3.sync.backup.plist

## tail logs
tail -f /tmp/s3.sync.backup.log /tmp/s3.sync.backup.err

launchctl load /Users/tatumszymczak/Library/LaunchAgents/s3.sync.backup.plist
launchctl unload /Users/tatumszymczak/Library/LaunchAgents/s3.sync.backup.plist
launchctl start s3.sync.backup.plist
