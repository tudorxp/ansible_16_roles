#!/bin/bash

export PATH=$PATH:$HOME/Library/Python/2.7/bin
export PYTHONPATH=$HOME/Library/Python/2.7/lib/python/site-packages/


ansible --help &>/dev/null

if [ $? != "0" ]; then
    echo Need to install ansible.
    sudo easy_install pip
    pip install ansible --user
    pip install setuptools --upgrade --user
    pip install passlib --user
fi


ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -f 20 -i inventory 2servers.yml

if [ $? == 0 ]; then
    echo
    echo Done\!
    echo

    ./listcreds.sh
else
    echo
    echo "Oops, an error occured (possibly due not enough cakes on sysadmin appreciation day)"
    echo
fi

