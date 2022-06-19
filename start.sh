#!/bin/bash
# update code upstream
python3 upstream.py


# set $HOME/.local/bin as non-root path
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH


# fetch token_v2.json from url

if [[ -n $JSON_FILE_URL ]]; then
	echo "Fetching token_v2.json from url"
	mkdir -p $HOME/.gdrive
    curl -o$HOME/.gdrive/token_v2.json "$JSON_FILE_URL"

fi
# start WebDAV server & stat the Telegram bot
npx webdav-cli --host 0.0.0.0 --port $PORT --directory --autoIndex --username 4a37zccpeelizhk7 --password $PASSWORD --path /app/ & python3 bot.py
