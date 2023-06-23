#!/usr/bin/env bash

apt update

apt upgrade -y

apt install -y build-essential gcc g++ gfortran python3-dev python3-venv make cmake ninja-build pkg-config autoconf
