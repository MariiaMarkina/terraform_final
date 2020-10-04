#!/bin/bash
apt-get -y update 
apt-get install git -y
apt install -y software-properties-common 
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible -y

git clone https://github.com/mariiamarkina/finaljenkins.git /etc/ansible/roles/finaljenkins.jenkins


ansible-playbook --connection=local --inventory 127.0.0.1, /etc/ansible/roles/finaljenkins.jenkins/Playbook.yml

