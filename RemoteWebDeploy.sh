#!/bin/bash

USR="devops"
for host in $(cat hostfile)
do
    echo "#######################################"
    echo "Connecting to $host"
    echo "Copying files to $host"
    echo "#######################################"

    # Copy webSetup.sh to /tmp/ on the remote host
    scp webSetup.sh $USR@$host:/tmp/
    echo "Successfully copied files to $host"

    # SSH into the remote host to execute commands
    ssh $USR@$host <<EOF
        sudo /tmp/webSetup.sh
        echo "Deployed the web Application"
        sudo rm -rf /tmp/webSetup.sh
EOF

    echo "#######################################"
done

