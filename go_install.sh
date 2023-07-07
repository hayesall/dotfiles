#!/usr/bin/env bash

# Requires sudo

curl -L https://go.dev/dl/go1.20.5.linux-amd64.tar.gz --output go1.20.5.linux-amd64.tar.gz

sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz

# Add: export PATH=$PATH:/usr/local/go/bin

rm go1.20.5.linux-amd64.tar.gz
