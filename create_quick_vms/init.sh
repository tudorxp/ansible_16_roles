#!/bin/bash

# prerequisites
# xcode ansible virtualbox vagrant


# Step 1 - generate Vagrant config file
ansible-playbook -i /dev/null generate_vagrantfile.yml 

if [ $? != '0' ]; then
	echo Failed generating Vagrant config file, exiting.
	exit 1
fi

# Step 2 - create the VMs
vagrant up --parallel

if [ $? != '0' ]; then
	echo Failed creating the VMs, exiting.
	exit 1
fi

# Step 3 - generate temp Ansible inventory 
ansible-playbook -i /dev/null generate_inventory_temp.yml 

if [ $? != '0' ]; then
	echo Failed generating temp Ansible inventory file, exiting.
	exit 1
fi

# Step 4 - Create SSH key, ansible user and sudo permissions
ansible-playbook -i inventory create_access.yml

if [ $? != '0' ]; then
	echo Failed creating SSH key/ansible user/sudo permissions, exiting.
	exit 1
fi


# Step 5 - Re-generate inventory with new access methods
ansible-playbook -i /dev/null generate_inventory.yml 

if [ $? != '0' ]; then
	echo Failed re-generating inventory.
	exit 1
fi



# Step 6 - Provision the hosts

echo Ready to provision
