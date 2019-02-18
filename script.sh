#!/bin/bash

# Install ansible
sudo apt update
sudo apt -y upgrade
sudo apt install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt -y install git ansible python-netaddr
mkdir /tmp/dev
cd /tmp/dev/
git clone https://gitlab.com/SK81/credits-ansible.git
cd credits-ansible

echo "[nodes]" > production
echo "MyNode2 ansible_host=mynode2 ansible_connection=ssh ansible_user={{vault_user}} ansible_ssh_pass={{vault_pass}}" >> production
echo "MyNode3 ansible_host=mynode3 ansible_connection=ssh ansible_user={{vault_user}} ansible_ssh_pass={{vault_pass}}" >> production
echo "MyNode4 ansible_host=mynode4 ansible_connection=ssh ansible_user={{vault_user}} ansible_ssh_pass={{vault_pass}}" >> production
echo "MyNode5 ansible_host=mynode5 ansible_connection=ssh ansible_user={{vault_user}} ansible_ssh_pass={{vault_pass}}" >> production
echo "[signals]" >> test.test
echo "MySignal1 ansible_host=localhost ansible_connection=ssh ansible_user={{vault_user}} ansible_ssh_pass={{vault_pass}}" >> production
