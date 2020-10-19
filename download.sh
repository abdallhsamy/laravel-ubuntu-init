#!/bin/bash

{ # this ensures the entire script is downloaded #

lsb_release -d | grep 'Ubuntu' >& /dev/null
[[ $? -ne 0 ]] && { echo "Only supports Ubuntu 20.04 system"; exit 1; }

DISTRO=$(lsb_release -c -s)
[[ ${DISTRO} -ne "focal" ]] && { echo "Only supports Ubuntu 20.04 system"; exit 1; }

green="\e[1;32m"
nc="\e[0m"

echo -e "${green}===> start download...${nc}"
cd $HOME
wget -q https://github.com/abdallhsamy/laravel-ubuntu-init/archive/master.tar.gz -O laravel-ubuntu-init.tar.gz
rm -rf laravel-ubuntu-init
tar zxf laravel-ubuntu-init.tar.gz
mv laravel-ubuntu-init-master laravel-ubuntu-init
rm -f laravel-ubuntu-init.tar.gz
echo -e "${green}===> Download complete${nc}"
echo ""
echo -e "${green}The installation script is located at: ${HOME}/laravel-ubuntu-init${nc}"

[ $(id -u) != "0" ] && {
    source ${HOME}/laravel-ubuntu-init/common/ansi.sh
    ansi -n --bold --bg-yellow --black "The current account is not root, please use the root account to execute the installation script (use the command: sudo -H -s to switch to root)"
} || {
    bash ./laravel-ubuntu-init/20.04/install.sh
}

cd - > /dev/null
} # this ensures the entire script is downloaded #
