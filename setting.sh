#!/bin/bash

set -euv

docker cp deploy:/root/.ssh/id_rsa.pub ~
chmod 0600 ~/id_rsa.pub
docker cp ~/id_rsa.pub setup:/root/.ssh/authorized_keys

temp=`mktemp`
cp ssh-config ${temp}
chmod 0600 ${temp}
docker cp ${temp} deploy:/root/.ssh/config
