#!/usr/bin/env bash

sudo apt install zsh

# First-time setup for changing shell to `zsh`
# Requires password
# chsh -s $(which zsh)

# Install ohmyzsh
# https://github.com/ohmyzsh/ohmyzsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install the powerlevel10k oh-my-zsh theme:
# https://github.com/romkatv/powerlevel10k#oh-my-zsh

# Maybe embed this directly in the dotfiles?
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors
