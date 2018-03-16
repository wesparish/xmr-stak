#!/bin/bash

export HOSTNAME=$(curl -s rancher-metadata/latest/self/host/name | cut -d'.' -f1)
export CONTAINER_NAME=$(curl -s rancher-metadata/latest/self/container/name)
export DOCKER_FQDN="$CONTAINER_NAME.$HOSTNAME"

[ -z "$POOL_ADDRESS" ] && export POOL_ADDRESS="etn-us-east1.nanopool.org:13333"
[ -z "$POOL_PASSWORD" ] && export POOL_PASSWORD="x"
[ -z "$WALLET_ADDRESS" ] && export WALLET_ADDRESS="etnkJMYgehRjLpWKECLYWi8SG69QZCBwCS7Jh1nx4YFx5gwdRmUfW8EDEQxpawMBwAeAXn9gJCHTbB4y55r2WmMk6QeeZaFFhZi.$HOSTNAME/$POOL_PASSWORD"

env

# Set args
set -- xmr-stak \
       --currency monero \
       -o $POOL_ADDRESS \
       -u $WALLET_ADDRESS \
       -p $POOL_PASSWORD

exec "$@"

