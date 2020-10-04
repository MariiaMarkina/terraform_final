#!/bin/bash
apt-get -y update 
apt-get install git -y
apt install -y software-properties-common 
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible -y
apt-get install -y python-psycopg2

git clone https://github.com/mariiamarkina/postgresrole.git /etc/ansible/roles/postgresrole.postgres
git clone https://github.com/mariiamarkina/javajdkrole.git /etc/ansible/roles/javajdkrole.javajdk
git clone https://github.com/mariiamarkina/tomcatrole.git /etc/ansible/roles/tomcatrole.tomcat


ansible-playbook --connection=local --inventory 127.0.0.1, /etc/ansible/roles/postgresrole.postgres/Playbook.yml
ansible-playbook --connection=local --inventory 127.0.0.1, /etc/ansible/roles/javajdkrole.javajdk/Playbook.yml
ansible-playbook --connection=local --inventory 127.0.0.1, /etc/ansible/roles/tomcatrole.tomcat/Playbook.yml


