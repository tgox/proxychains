#!/bin/bash

clear
echo ""
echo "#############################################################"
echo "# Install  Shadowsocks client                               #"
echo "# Intro: https://github.com/tgox/autoproxy.git              #"
echo "# Author: Terry Go <gqlpub@gmail.com>                       #"
echo "#############################################################"
echo ""

DIR=${HOME}/.proxychains

checkos() {
    if  cat /etc/issue | grep -q -E -i "ubuntu"; then
        OS=Ubuntu
    elif cat /proc/version | grep -q -E -i "ubuntu"; then
        OS=Ubuntu
    else
        echo "Not supported Operatintg System."
    fi
}

install() {
    if [ $OS='Ubuntu' ]; then
        apt-get install -y python-pip
        pip install shadowsocks
        apt-get install -y proxychains
    fi
}

run_config() {
	echo "running shadowsocks"
	sslocal -c $DIR/shadowsocks.json -d start
}

# Main Install function
autoproxy() {
    checkos
    install
    run_config
}

autoproxy
