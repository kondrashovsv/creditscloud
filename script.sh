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
sudo chown -R $1:$1 /tmp/dev/credits-ansible
cd credits-ansible

echo "[nodes]" > production
# echo "MyNode2 ansible_host=mynode2 ansible_connection=ssh ansible_user={{vault_user}} ansible_ssh_pass={{vault_pass}}" >> production
# echo "MyNode3 ansible_host=mynode3 ansible_connection=ssh ansible_user={{vault_user}} ansible_ssh_pass={{vault_pass}}" >> production
# echo "MyNode4 ansible_host=mynode4 ansible_connection=ssh ansible_user={{vault_user}} ansible_ssh_pass={{vault_pass}}" >> production
# echo "MyNode5 ansible_host=mynode5 ansible_connection=ssh ansible_user={{vault_user}} ansible_ssh_pass={{vault_pass}}" >> production
echo "MyNode1 ansible_host=mynode1 ansible_connection=ssh ansible_user=$1 ansible_ssh_pass=$2" >> production
echo "MyNode2 ansible_host=mynode2 ansible_connection=ssh ansible_user=$1 ansible_ssh_pass=$2" >> production
echo "MyNode3 ansible_host=mynode3 ansible_connection=ssh ansible_user=$1 ansible_ssh_pass=$2" >> production
echo "MyNode4 ansible_host=mynode4 ansible_connection=ssh ansible_user=$1 ansible_ssh_pass=$2" >> production
echo "[nodes:vars]" >> production
echo "ansible_python_interpreter=/usr/bin/python3" >> production

echo "[monitors]" >> production
echo "MyNode5 ansible_host=mynode5 ansible_connection=ssh ansible_user=$1 ansible_ssh_pass=$2" >> production
echo "[monitors:vars]" >> production
echo "ansible_python_interpreter=/usr/bin/python3" >> production

echo "[signals]" >> production
echo "MySignal1 ansible_host=localhost ansible_connection=ssh ansible_user=$1 ansible_ssh_pass=$2" >> production

echo "export ANSIBLE_HOST_KEY_CHECKING=False" > start.sh
echo "ansible-playbook -i production site.yml" >> start.sh

sudo chmod +x /tmp/dev/credits-ansible/start.sh
