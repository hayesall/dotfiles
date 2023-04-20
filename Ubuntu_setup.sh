#!/usr/bin/env bash

# Alexander's Ubuntu Setup
#
# Setup an Ubuntu system from a fresh install.
#
# TODO
# ----
#
# - Docstrings / Man Page
# - Configuration for what to install.

RED='\033[0;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
NC='\033[0m'

function setup_powerline() {
    # Powerline is a theme that is part of "Bash-It"
    # https://github.com/Bash-it/bash-it

    printf "${YELLOW}[STATUS]: Setup Bash-It Powerline Theme${NC}\n\n"

    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

    (
        cd ~/.bash_it/
        bash install.sh --silent
    )

    curl -L https://gist.githubusercontent.com/hayesall/290606cbdc7e143fd18e2a428bfa122c/raw/774d2e8e1631be3ae25ba7d52f44f3c3aee8916d/powerline.theme.bash > ~/.bash_it/themes/powerline/powerline.theme.bash

    sed -i "s/export BASH_IT_THEME='bobby'/export BASH_IT_THEME='powerline'/g" ~/.bashrc
}

function remove_powerline() {
    printf "${RED}[STATUS]: Removing Bash-It Powerline Theme${NC}\n\n"
    (
        cd ~/.bash_it/
        ./uninstall.sh
    )
    rm -rf ~/.bash_it/
}

function setup_miniconda() {
    # Miniconda is a tool for managing Python environments.

    printf "${YELLOW}[STATUS]: Setup Miniconda${NC}\n\n"

    curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh > miniconda_install.sh

    # Install in batch mode
    bash miniconda_install.sh -b

    # In batch mode, conda init must be ran manually
    /home/hayesall/miniconda3/bin/python /home/hayesall/miniconda3/bin/conda init

    rm -f miniconda_install.sh
}

function setup_rust() {
    # Rust is a programming language

    printf "${YELLOW}[STATUS]: Setup Rust${NC}\n"

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rust_install.sh
    bash rust_install.sh -y
    rm rust_install.sh
    echo 'export PATH="/home/hayesall/.cargo/bin:$PATH"' >> ~/.bashrc
}

function setup_packages() {
    # Catch-all to set up a development environment.

    sudo apt install git --yes
    sudo apt install make --yes
    sudo apt-get install gcc --yes
    sudo apt-get install g++ --yes
    sudo apt install default-jdk --yes
}

function setup_bat() {
    # Bat is a cat clone with syntax highlighting and other nice features.
    cargo install --locked bat
}

function main() {
    setup_packages
    setup_powerline
    setup_miniconda
    setup_rust
    setup_bat
}

main
