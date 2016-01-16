#!/bin/bash
set -e

getent group docker || groupadd -g $(ls -l /var/run/docker.sock | awk '{ print $4 }') docker
usermod -aG docker nobody

/bin/bash /entrypoint.sh $@