#!/bin/bash

cd /opt    # change directory to /opt
wget https://github.com/gophish/gophish/releases/download/v0.11.0/gophish-v0.11.0-linux-64bit.zip    # download the gophish zip
unzip gophish-v0.11.0-linux-64bit.zip       # unzip the gophish zip file
sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' config.json   # replate 127.0.0.1 with 0.0.0.0
chmod +x ./gophish   # set executable bit on gophish program
./gophish            # finally just run the program
