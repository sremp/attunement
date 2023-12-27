#!/bin/bash

##### Inputs
# options prompt:
### attuning a new system (fresh install, do everything)
### re-attuning (custom config, config selected options)
#### optional "default" theming??
#### arg for only generating SSH + GPG??

##### Steps
# 1. check OS
# 2. check attune or re-attune (flag?)
# 3. identify user + {HOME}
# 4. install apps (array w/ apps based on OS + flag?)
# 5. copy relevant configs from attunement
# 6. generate SSH + GPG if fresh attune or custom set (unique filenames needed)


##### OS specifics
# Mac:
### install brew if not installed
### install gpg if not installed
# Linux
### TBD


### GPG config
# check if key already exists
# output format:
# ed25519/XXXXXXXXXXXXXX 2023-07-10 [SC]
# $GPG_SECID = $(gpg --list-secret-keys --keyid-format=long | grep sec | sed <grab ID after />)
# TODO: add GPG via GH API???

config_dir="$HOME/.config"

# Create config directory if not found
if [ ! -d "${config_dir}" ]; then
  echo "${config_dir} not found. Creating..."
  mkdir ${config_dir}
  echo "Config directory ${config_dir} created."
fi

# Copy .oh-my-zsh submodule
echo "Installing Oh My Zsh..."
if [ -d "${HOME}/.oh-my-zsh" ]; then
  echo "Overwrite existing Oh My Zsh installation? Y/[n]"
else
  echo "Installing Oh My Zsh from submodule... (${HOME}/.oh-my-zsh)"
  cp -r ./.oh-my-zsh ${HOME}/
fi

# Copy ranger config
echo "Copying ranger config..."
if [ -d "${config_dir}/ranger" ]; then
  if [ -f "${config_dir}/ranger/rc.conf" ]; then
    echo "Overwrite existing Ranger config? Y/[n]"
  else
    echo "Applying Ranger config... (${config_dir}/ranger/rc.conf)"
    cp ./.config/ranger/rc.conf ${config_dir}/ranger/rc.conf
  fi
else
  echo "Creating Ranger config directory..."
  cp -r ./config/ranger ${config_dir}
fi
