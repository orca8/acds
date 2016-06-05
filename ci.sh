#!/bin/bash

# check deploy
cd /opt/serverspec; rake spec:localhost;
# setup system
cd /opt/ansible; ansible-playbook -i hosts playbook.yml;
# check setup
cd /opt/serverspec; rake spec:setup;
