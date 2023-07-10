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
# 3. identify user + homedir
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

# Identify user
USER=$(whoami)
HOMEDIR="/Users/$USER/"
CONFIGDIR="$HOMEDIR/.config/"

# Create config directory if not found
if [ ! -d "$HOMEDIR/.config" ]; then
  echo "Config directory not found. Creating $CONFIGDIR"
fi

# Copy ranger config
if [ -d "$CONFIGDIR/ranger" ]; then
  if [ -f "$CONFIGDIR/ranger/rc.conf" ]; then
    echo "Overwrite existing Ranger config? (Y/n)"
  else
    echo "Applying Ranger config... ($CONFIGDIR/ranger/rc.conf)"
    cp ./.config/ranger/rc.conf $CONFIGDIR/ranger/rc.conf
  fi
else
  cp -r ./config/ranger $CONFIGDIR
fi 
