
#!/bin/bash
sudo -i

sudo -u jenkins sed -i \"/db.url=/ s/=.*/=alfresco-rds.chof5nbig7hv.us-east-1.rds.amazonaws.com/\" /data/apache-tomcat-7.0.55-alfresco/shared/classes/alfresco-global.properties
sudo apt-get update -y && sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update && sudo apt-get install ansible -y
ansible-playbook /tmp/provision.yml

exit
