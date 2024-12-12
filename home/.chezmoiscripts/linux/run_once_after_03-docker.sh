#!/bin/bash

echo "----- start: 02-docker.sh -----"
if [[ ! -x "$(command -v docker)" ]]; then
    if [[ ! $OSTYPE == 'darwin'* ]]; then
        yay -S docker docker-compose --noconfirm --needed
        systemctl enable --now docker
        sudo usermod -aG docker $USER
        newgrp docker # switch to docker group straight away
    else
        chezmoi_warnings+=("/!\ Need to install docker manually on MacOS /!\ ")
    fi
else
    echo "docker is already installed"
fi
echo "----- end: 02-docker.sh -----"
