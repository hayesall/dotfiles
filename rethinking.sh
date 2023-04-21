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

# Setup miniconda

curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output ~/setup_miniconda.sh

bash ~/setup_miniconda.sh -b

/home/hayesall/miniconda3/bin/python /home/hayesall/miniconda3/bin/conda init

# Turn off the feature where conda auto-activates `base`
/home/hayesall/miniconda3/bin/conda init config --set auto_activate_base false

rm -f ~/setup_miniconda.sh
