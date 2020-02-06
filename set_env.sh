#!/bin/bash

# defined UID, GID, UNAME
UID=$(id -u)
GID=$(id -g)
UNAME=$(id -u -n)

# if '.env' does not exist, create it
if [ ! -e "./.env" ]; then
    cat > .env << EOF
UID=${UID}
GID=${GID}
UNAME=${UNAME}
EOF

    echo ".env created by set_env.sh"
else
    echo ".env is already exist"
fi
