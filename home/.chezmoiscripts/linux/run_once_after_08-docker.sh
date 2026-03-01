#!/bin/bash

echo "----- start: 08-docker.sh -----"
if [[ ! -x "$(command -v docker)" ]]; then
    if [[ ! $OSTYPE == 'darwin'* ]]; then
        yay -S docker docker-compose --noconfirm --needed
        systemctl enable --now docker
        sudo usermod -aG docker "$USER"
        newgrp docker # switch to docker group straight away
    else
        tput setaf 3
        echo "/!\ Need to install docker manually on MacOS /!\ " | tee -a /tmp/chezmoi_warnings.log
        tput sgr0
    fi
else
    echo "docker is already installed"
fi
echo "----- end: 08-docker.sh -----"
