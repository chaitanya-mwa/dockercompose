#!/bin/bash
set -e

# if the group  exists then just add the nobody user to this group so php car use the docker socket
# otherwise create the group with the same gui and add the nobody user to that group
if getent group $(ls -l /var/run/docker.sock | awk '{ print $4 }')
then
        usermod -aG $(ls -l /var/run/docker.sock | awk '{ print $4 }') nobody
else
        getent group docker || groupadd -g $(ls -ln /var/run/docker.sock | awk '{ print $4 }') docker
        usermod -aG docker nobody
fi
/bin/bash /entrypoint.sh $@