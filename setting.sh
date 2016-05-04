#!/bin/bash

set -euv

docker cp deploy:/root/.ssh/id_rsa.pub ~
chmod 0600 ~/id_rsa.pub
docker cp ~/id_rsa.pub setup:/root/.ssh/authorized_keys
