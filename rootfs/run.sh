#!/bin/sh

if [ -z ${MONGODB_ROOT_PASSWORD+x} ]; then
    echo "env MONGODB_ROOT_PASSWORD required"
    exit 1
fi

mkdir -p /data/db
chown mongodb:mongodb /data/db

gosu mongodb mongod --auth &
sleep 5

# test mongodb authentication
mongo --eval 'quit()' -u root -p ${MONGODB_ROOT_PASSWORD} admin
if [ "$?" != "0" ]; then
    echo "creating root user"
    mongo --eval "db.getSiblingDB('admin').createUser({user: 'root', pwd: '${MONGODB_ROOT_PASSWORD}', roles: [{ role: 'root', db: 'admin'}]});"
fi

wait
