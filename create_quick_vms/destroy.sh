#!/bin/bash

# destroy the evidence


# Step 1 - generate Vagrant config file
ansible-playbook -i /dev/null generate_vagrantfile.yml 

if [ $? != '0' ]; then
	echo Failed generating Vagrant config file, exiting.
	exit 1
fi

# Step 2 - destroy the VMs
for vm in `cat Vagrantfile |grep define|cut -f2 -d\"`; do vagrant destroy -f $vm; done

if [ $? != '0' ]; then
	echo Failed creating the VMs, exiting.
	exit 1
fi

# Step 3 - remove stuff  
rm -f inventory ssh_masterkey ssh_masterkey.pub
