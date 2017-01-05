#!/bin/bash
set -v

############################################################
#################Ensures VM has all updates#################
############################################################
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

############################################################
###################Install Docker-Compose###################
############################################################
sudo curl -sL "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

############################################################
###########Install Docker-Compose Bash Completion###########
############################################################
sudo curl -sL "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose" -o /etc/bash_completion.d/docker-compose

############################################################
###################Install Docker-Machine###################
############################################################
sudo curl -sL "https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-machine
sudo chmod +x /usr/local/bin/docker-machine
docker-machine version

############################################################
###########Install Docker-Machine Bash Completion###########
############################################################
sudo curl -sL "https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash" -o /etc/bash_completion.d/docker-machine
sudo curl -sL "https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash" -o /etc/bash_completion.d/docker-machine-wrapper
sudo curl -sL "https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-prompt.bash" -o /etc/bash_completion.d/docker-machine-prompt
