#!/usr/bin/env bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-init.sh

sh rustup-init.sh -y

rm -f rustup-init.sh
