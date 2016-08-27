#!/bin/bash

rsync -avz --exclude '*node_modules*' --exclude '*.git*' --exclude '*.DS_Store' '/Users/tatumszymczak/Code/' '/Users/tatumszymczak/Library/Mobile Documents/com~apple~CloudDocs/Code/' --delete
