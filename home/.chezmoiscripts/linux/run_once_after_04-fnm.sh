#!/bin/bash

echo "----- start: 04-fnm.sh -----"
if [ ! -x "$(command -v fnm)" ]; then
    echo "Installing fnm..."
    brew install fnm

    echo "Installing and setting as default lts/iron..."
    fnm install lts/iron
    fnm use lts/iron

    fielse
    echo "fnm is already installed"

fi
echo "----- end: 04-fnm.sh -----"
