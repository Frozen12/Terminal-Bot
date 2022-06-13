#!/bin/bash

# update code upstream
python3 upstream.py

# Install gdrive
wget "https://github.com/prasmussen/gdrive/releases/download/2.1.1/gdrive_2.1.1_linux_amd64.tar.gz"
mkdir -p .local/bin
tar -zxf gdrive_2.1.1_linux_amd64.tar.gz -C .local/bin

export PATH=.local/bin:$PATH
echo "gdrive installed successfully"
# remove junk
rm -rf gdrive_2.1.1_linux_amd64.tar.gz *.txt *yml *.md


# fetch token_v2.json from url

if [[ -n $JSON_FILE_URL ]]; then
	echo "Fetching token_v2.json from url"
	mkdir -p .gdrive
    curl -o.gdrive/token_v2.json "$JSON_FILE_URL"

fi

python3 bot.py
