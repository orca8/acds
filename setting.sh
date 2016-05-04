#!/bin/bash

set -euv

docker cp deploy:/root/.ssh/id_rsa.pub ~
chmod 0600 ~/id_rsa.pub
docker cp ~/id_rsa.pub setup:/root/.ssh/authorized_keys
chmod 0600 ssh-config
docker cp ssh-config deploy:/root/.ssh/config
