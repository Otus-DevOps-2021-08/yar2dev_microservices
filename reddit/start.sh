#!/bin/bash

/usr/bin/mongod --fork --logpath /var/log/mongod.log

cd /reddit && puma || exit
